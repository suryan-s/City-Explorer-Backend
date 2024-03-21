from os import environ

import requests
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.authentication import JWTAuthentication

OPENWEATHER_API_KEY = environ.get('OPENWEATHER_API_KEY')


class WeatherInfoView(APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        """
        Fetches weather information from the OpenWeather API.
        """
        city = request.GET.get('city', None)
        if city is None:
            return Response({'detail': 'City name not provided!'}, status=status.HTTP_400_BAD_REQUEST)
        url = f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid={OPENWEATHER_API_KEY}&units=metric'
        response = requests.get(url)
        if response.status_code == 200:
            data = response.json()
            data["main"]["status"] = data["weather"][0]["main"]
            data["main"]["description"] = data["weather"][0]["description"]
            return Response(data["main"], status=status.HTTP_200_OK)
        elif response.status_code == 429:
            return Response({'detail': 'Too Many Requests!'}, status=status.HTTP_404_NOT_FOUND)
        elif response.status_code == 404:
            return Response({'detail': 'City not found!'}, status=status.HTTP_404_NOT_FOUND)
        return Response({'detail': 'Failed to fetch weather information!'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
