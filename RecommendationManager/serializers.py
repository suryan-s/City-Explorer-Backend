from rest_framework import serializers

from RecommendationManager.models import Weather, TimeOfDay, Entertainment, Cuisine, IndoorActivity, OutdoorActivity


class WeatherSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=255)
    description = serializers.CharField()

    def create(self, validated_data):
        return Weather.objects.create(**validated_data)


class TimeOfDaySerializer(serializers.Serializer):
    name = serializers.CharField(max_length=255)
    description = serializers.CharField()

    def create(self, validated_data):
        return TimeOfDay.objects.create(**validated_data)


class EntertainmentSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=255)
    description = serializers.CharField()

    def create(self, validated_data):
        return Entertainment.objects.create(**validated_data)


class CuisineSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=255)
    description = serializers.CharField()

    def create(self, validated_data):
        return Cuisine.objects.create(**validated_data)


class IndoorActivitySerializer(serializers.ModelSerializer):
    class Meta:
        model = IndoorActivity
        fields = ['name']


class OutdoorActivitySerializer(serializers.ModelSerializer):
    class Meta:
        model = OutdoorActivity
        fields = ['name']
