from django.contrib.auth import authenticate
from django.contrib.auth.tokens import default_token_generator
from django.core.cache import cache
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.urls import reverse
from django.utils import timezone
from django.utils.encoding import force_str, force_bytes
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from rest_framework import status
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response
from rest_framework.throttling import ScopedRateThrottle
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import AccessToken, RefreshToken
from rest_framework_simplejwt.views import TokenRefreshView

from AuthManager.models import UserProfile
from AuthManager.serializers import UserProfileSerializer, LoginSerializer, UserViewDataSerializer


class CustomScopedRateThrottle(ScopedRateThrottle):
    def allow_request(self, request, view):
        if request.user.is_authenticated:
            return True
        return super().allow_request(request, view)


class RegisterView(APIView):
    permission_classes = [AllowAny]
    throttle_classes = [ScopedRateThrottle]
    throttle_scope = 'register'

    def post(self, request):
        """
        API endpoint to register a new user.
        :param request:
        """
        serializer = UserProfileSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)


class LoginView(APIView):
    permission_classes = [AllowAny]
    throttle_classes = [ScopedRateThrottle]
    throttle_scope = 'login'

    def post(self, request):
        """
        API endpoint to log in a user.
        :param request:
        """
        # initial_queries = len(connection.queries)
        serializer = LoginSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        email = serializer.validated_data.get('email')
        password = serializer.validated_data.get('password')

        user = authenticate(request, username=email, password=password)

        if user is None or not user.check_password(password):
            return Response(
                {'detail': 'Invalid credentials!'},
                status=status.HTTP_401_UNAUTHORIZED)

        access_token = AccessToken.for_user(user)
        refresh_token = RefreshToken.for_user(user)

        user.last_login = timezone.now()
        user.save()

        # token, created = Token.get_or_create(user=user)

        response = Response()
        response.set_cookie(key='refresh_token', value=refresh_token, httponly=False, secure=True, samesite='Strict')
        response.set_cookie(key='access_token', value=access_token, httponly=False, secure=True, samesite='Strict')
        response.data = {
            'detail': 'User Logged In Successfully',
            'username': user.username,
            'access-token': str(access_token),
            'refresh-token': str(refresh_token),
        }
        # print(len(connection.queries) - initial_queries)
        return response


# noinspection PyMethodMayBeStatic
class LogoutView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        """
        API endpoint to log out a user.
        :param request:
        :return: Response
        """
        response = Response()
        try:
            # request.user.auth_token.delete()
            if request.COOKIES.get('refresh_token') is None or request.COOKIES.get('access_token') is None:
                response.data = {
                    'detail': 'User not logged in',
                }
                response.status_code = status.HTTP_400_BAD_REQUEST
                return response
            refresh_token = request.COOKIES.get('refresh_token')
            token = RefreshToken(refresh_token)
            token.blacklist()
            response.delete_cookie('refresh_token', samesite='Strict')
            response.delete_cookie('access_token', samesite='Strict')
            response.status_code = status.HTTP_205_RESET_CONTENT
        except Exception as e:
            response.data = {
                'detail': 'User Logged Out Failed',
                'error': str(e)
            }
            response.status_code = status.HTTP_400_BAD_REQUEST
        finally:
            return response


class UserDataView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        user = request.user
        data = cache.get(f'user-{str(user.id)}')
        if data is None:
            data = UserViewDataSerializer(UserProfile.objects.get(id=user.id)).data
            cache.set(f'user-{str(user.id)}', data, timeout=3000)

        return Response({'detail': data}, status=status.HTTP_200_OK)


class RefreshTokenView(TokenRefreshView):
    permission_classes = [AllowAny]
    throttle_scope = 'refresh'

    def post(self, request, *args, **kwargs):
        """
        Generate access token from the refresh token
        """
        refresh_token = request.COOKIES.get('refresh_token')
        if not refresh_token:
            return Response({'detail': 'Refresh token is invalid.'}, status=status.HTTP_400_BAD_REQUEST)
        try:
            response = Response()
            token = RefreshToken(refresh_token)
            token.verify()

            access_token = token.access_token
            response.set_cookie(key='access_token', value=access_token, httponly=True, secure=True, samesite='Strict')
            response.data = {'detail': 'Access token is generated.'}
            response.status_code = status.HTTP_200_OK
            return response
        except Exception as e:
            return Response({'detail': e}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
