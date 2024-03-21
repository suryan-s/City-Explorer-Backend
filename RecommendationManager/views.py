import random

from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.authentication import JWTAuthentication

from RecommendationManager.models import IndoorActivity, OutdoorActivity
from RecommendationManager.serializers import WeatherSerializer, CuisineSerializer, EntertainmentSerializer, \
    TimeOfDaySerializer, OutdoorActivitySerializer, IndoorActivitySerializer
from UserManager.models import UserPreferences, UserRecommendationHistory
from WeatherDatamanager.views import WeatherInfoView

IndoorWeather = ['Tornado', 'Rain', 'Snow', 'Thunderstorm', 'Drizzle', 'Mist', 'Haze', 'Fog', 'Sand', 'Dust', 'Ash',
                 'Squall', 'Smoke', 'overcast clouds']
OutdoorWeather = ['Clear', 'Clouds', 'Sunny', 'Partly Cloudy', 'Windy',
                  'Tropical Storm', 'few clouds', 'scattered clouds', 'broken clouds']


class RecommendActivityView(APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        city = request.GET.get('city', None)
        if city is None:
            return Response({'detail': 'City not provided!'}, status=status.HTTP_400_BAD_REQUEST)
        request.GET = request.GET.copy()
        request.GET['city'] = city
        weather_info_view = WeatherInfoView()
        result = weather_info_view.get(request)
        # print(result)
        # print(result.data)
        if result.status_code == 200:
            weather_data = result.data
            # print(weather_data)
            if weather_data['temp'] > 30 or weather_data['temp'] < 10:
                preference = "Indoor"
            elif weather_data['status'] in IndoorWeather or weather_data['description'] in IndoorWeather:
                preference = "Indoor"
            elif weather_data['status'] in OutdoorWeather or weather_data['description'] in OutdoorWeather:
                preference = "Outdoor"
            else:
                preference = "Outdoor"
            # print(preference)
            if preference == "Indoor":
                user_preferences = UserPreferences.objects.get(user=request.user)
                preferred_activities = user_preferences.preferred_indoor_activities.all()
                extra_activities = IndoorActivity.objects.exclude(id__in=preferred_activities)
                extra_activities = random.sample(list(extra_activities), min(3, len(extra_activities)))

                preferred_activities_names = [activity.name for activity in preferred_activities]
                extra_activities_names = [activity.name for activity in extra_activities]

                body = {'preferred': preferred_activities_names, 'suggested': extra_activities_names}
                UserRecommendationHistory.objects.create(user=request.user, recommendation=body)
                return Response(
                    body,
                    status=status.HTTP_200_OK)
            else:
                user_preferences = UserPreferences.objects.get(user=request.user)
                preferred_activities = user_preferences.preferred_outdoor_activities.all()
                extra_activities = OutdoorActivity.objects.exclude(id__in=preferred_activities)
                extra_activities = random.sample(list(extra_activities), min(3, len(extra_activities)))

                preferred_activities_names = [activity.name for activity in preferred_activities]
                extra_activities_names = [activity.name for activity in extra_activities]

                body = {'preferred': preferred_activities_names, 'suggested': extra_activities_names}
                UserRecommendationHistory.objects.create(user=request.user, recommendation=body)
                return Response(
                    body,
                    status=status.HTTP_200_OK)
        else:
            return Response({'detail': f'{result.data}'}, status=result.status_code)


class ActivityView(APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        pass

    def post(self, request):
        activity_type = request.data.get('type', None)
        print(activity_type)
        serializer = None
        if activity_type == "weather":
            serializer = WeatherSerializer(data=request.data)
        elif activity_type == "cuisine":
            serializer = CuisineSerializer(data=request.data)
        elif activity_type == "entertainment":
            serializer = EntertainmentSerializer(data=request.data)
        elif activity_type == "timeofday":
            serializer = TimeOfDaySerializer(data=request.data)
        else:
            return Response({'detail': 'Invalid activity type!'}, status=status.HTTP_400_BAD_REQUEST)

        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
