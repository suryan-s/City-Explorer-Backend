from rest_framework import serializers

from AuthManager.models import UserProfile
from UserManager.models import UserPreferences, UserRecommendationHistory


class UserBaseInfoViewDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ['username', 'first_name', 'last_name', 'email', 'city', 'state', 'country']


class UserPreferencesViewDataSerializer(serializers.ModelSerializer):
    # username = serializers.SerializerMethodField()

    # def get_username(self, obj):
    #     """
    #     Get the username from the user object.
    #     :param obj:
    #     :return:
    #     """
    #     return obj.user.username

    class Meta:
        model = UserPreferences
        fields = ['user', 'preferred_location', 'preferred_indoor_activities', 'preferred_outdoor_activities',
                  'preferred_cuisine', 'preferred_entertainment', 'preferred_weather', 'preferred_time']


class UserPreferencesGetViewDataSerializer(serializers.ModelSerializer):
    preferred_indoor_activities = serializers.StringRelatedField(many=True)
    preferred_outdoor_activities = serializers.StringRelatedField(many=True)
    preferred_cuisine = serializers.StringRelatedField(many=True)
    preferred_entertainment = serializers.StringRelatedField(many=True)
    preferred_weather = serializers.StringRelatedField(many=True)
    preferred_time = serializers.StringRelatedField(many=True)

    class Meta:
        model = UserPreferences
        fields = ['user', 'preferred_location', 'preferred_indoor_activities', 'preferred_outdoor_activities',
                  'preferred_cuisine', 'preferred_entertainment', 'preferred_weather', 'preferred_time']


class UserPreferencesCreateViewDataSerializer(serializers.ModelSerializer):
    pass


class UserPreferencesUpdateViewDataSerializer(serializers.ModelSerializer):
    pass


class UserRecommendationHistoryViewDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserRecommendationHistory
        fields = ['id', 'recommendation']
