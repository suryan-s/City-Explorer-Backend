from rest_framework import status
from rest_framework.generics import get_object_or_404
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.authentication import JWTAuthentication

from AuthManager.models import UserProfile
from RecommendationManager.models import Cuisine, Entertainment, TimeOfDay, Weather, IndoorActivity, OutdoorActivity
from UserManager.models import UserRecommendationHistory, UserPreferences
from UserManager.serializers import UserBaseInfoViewDataSerializer, UserRecommendationHistoryViewDataSerializer, \
    UserPreferencesViewDataSerializer, UserPreferencesGetViewDataSerializer


class UserInfoView(APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        """
        Fetches user data from the database.
        :param request:
        :return:
        """
        try:
            queryset = UserProfile.objects.get(id=request.user.id)
        except UserProfile.DoesNotExist:
            return Response({'detail': 'Data not found!'}, status=status.HTTP_404_NOT_FOUND)
        result = UserBaseInfoViewDataSerializer(queryset, many=False)

        return Response({'detail': result.data}, status=status.HTTP_200_OK)

    def put(self, request):
        """
        Updates user data in the database.
        :param request:
        :return:
        """
        user_data = get_object_or_404(UserProfile, id=request.user.id)
        serializer = UserBaseInfoViewDataSerializer(user_data, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request):
        """
        Deletes user data from the database.
        :param request:
        :return:
        """
        user_data = get_object_or_404(UserProfile, id=request.user.id)
        user_data.delete()
        return Response({'detail': 'User deleted successfully'}, status=status.HTTP_200_OK)


class UserRecommendationHistoryView(APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        """
        Fetches user recommendation history from the database.
        :param request:
        :return:
        """
        queryset = UserRecommendationHistory.objects.filter(user=request.user)
        if queryset.exists():
            result = UserRecommendationHistoryViewDataSerializer(queryset, many=True)
            return Response({'detail': result.data}, status=status.HTTP_200_OK)
        else:
            return Response({'detail': 'No recommendation history'}, status=status.HTTP_404_NOT_FOUND)

    def delete(self, request):
        """
        Deletes user recommendation history from the database.
        :param request:
        :return:
        """
        item_id = request.GET.get('id')
        if item_id:
            queryset = get_object_or_404(UserRecommendationHistory, id=item_id, user=request.user)
            # if queryset.user != request.user:
            #     return Response({'detail': 'You are not authorized to delete this data!'},
            #                     status=status.HTTP_403_FORBIDDEN)
            queryset.delete()
            return Response({'detail': 'Recommendation history deleted successfully'},
                            status=status.HTTP_204_NO_CONTENT)
        else:
            return Response({'detail': 'Please provide a valid id!'}, status=status.HTTP_200_OK)


class UserPreferencesView(APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        """
        Fetches user preferences from the database.
        :param request:
        :return:
        """
        queryset = UserPreferences.objects.filter(user=request.user)
        if queryset.exists():
            result = UserPreferencesGetViewDataSerializer(queryset, many=True)
            return Response({'detail': result.data}, status=status.HTTP_200_OK)
        else:
            return Response({'detail': 'No preferences found!'}, status=status.HTTP_404_NOT_FOUND)

    def post(self, request):
        if UserPreferences.objects.filter(user=request.user).exists():
            return Response({'detail': 'Preferences already exist!'}, status=status.HTTP_400_BAD_REQUEST)

        preference_data = request.data.copy()

        preference_models = {
            'preferred_cuisine': Cuisine,
            'preferred_entertainment': Entertainment,
            'preferred_time': TimeOfDay,
            'preferred_weather': Weather,
            'preferred_indoor_activities': IndoorActivity,
            'preferred_outdoor_activities': OutdoorActivity
        }

        for preference, model in preference_models.items():
            preference_names = preference_data.pop(preference, [])
            if not preference_names:
                return Response({'detail': f'Please provide {preference}!'}, status=status.HTTP_400_BAD_REQUEST)
            preferences = model.objects.filter(name__in=preference_names)
            if len(preference_names) != preferences.count():
                return Response({'detail': f'Invalid {preference} names provided!'}, status=status.HTTP_400_BAD_REQUEST)
            # Replace the preference names with their corresponding pk values
            preference_data[preference] = [pref.pk for pref in preferences]

        preference_data['user'] = request.user.id
        serializer = UserPreferencesViewDataSerializer(data=preference_data)
        serializer.is_valid(raise_exception=True)
        user_preferences = serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    def put(self, request):
        """
        Updates user preferences in the database.
        :param request:
        :return:
        """
        user_preferences = get_object_or_404(UserPreferences, user=request.user)
        serializer = UserPreferencesViewDataSerializer(user_preferences, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request):
        """
        Deletes user preferences from the database.
        :param request:
        :return:
        """
        queryset = get_object_or_404(UserPreferences, user=request.user)
        queryset.delete()
        return Response({'detail': 'Preferences deleted successfully'}, status=status.HTTP_200_OK)

