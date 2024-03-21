import re

import requests
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.authentication import JWTAuthentication


def fetch_tourist_spots(latitude, longitude, radius=50):
    """
    Fetches tourist spots around a given location using the Overpass API.
    :param latitude:
    :param longitude:
    :param radius:
    :return:
    """
    query = f"""
    [out:json];
    (
      node(around:{radius},{latitude},{longitude})["tourism"];
      way(around:{radius},{latitude},{longitude})["tourism"];
      relation(around:{radius},{latitude},{longitude})["tourism"];
    );
    out body;
    """
    response = requests.post("https://overpass-api.de/api/interpreter", data=query)
    return response


class LocationInfoView(APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        """
        Fetches location data from the database.
        """
        city_name = request.GET.get('city', None)
        state_name = request.GET.get('state', None)
        country_name = request.GET.get('country', None)
        if city_name is None or state_name is None or country_name is None:
            return Response({'detail': 'City, state, or country name not provided!'},
                            status=status.HTTP_400_BAD_REQUEST)
        is_correct_name = lambda place: bool(re.match("^[a-zA-Z ',-]*$", place))
        if not is_correct_name(city_name) or not is_correct_name(state_name) or not is_correct_name(country_name):
            return Response({'detail': 'Invalid city, state, or country name!'}, status=status.HTTP_400_BAD_REQUEST)

        url = f"https://nominatim.openstreetmap.org/search.php"
        response = requests.get(url, params={'city': city_name, 'state': state_name, 'country': country_name,
                                             'format': 'jsonv2', 'addressdetails': 1, 'limit': 1})
        data = response.json()
        if data:
            lat = float(data[0]["lat"])
            lon = float(data[0]["lon"])
            response2 = fetch_tourist_spots(lat, lon)
            if response2.status_code == 200:
                spot_data = response2.json()
                if spot_data["elements"]:
                    return Response(
                        {'tourist_spots': spot_data["elements"], 'location': {'latitude': lat, 'longitude': lon}},
                        status=status.HTTP_200_OK)
                else:
                    return Response({'detail': 'No tourist spots found!'}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({'detail': 'No tourist spots found!'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({'detail': 'Location not found!'}, status=status.HTTP_404_NOT_FOUND)
