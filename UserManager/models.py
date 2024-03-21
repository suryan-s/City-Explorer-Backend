import uuid

from django.db import models

from AuthManager.models import UserProfile
from RecommendationManager.models import Cuisine, Entertainment, Weather, TimeOfDay


class UserPreferences(models.Model):
    id = models.UUIDField(primary_key=True, editable=False, unique=True, default=uuid.uuid4)
    user = models.OneToOneField(UserProfile, on_delete=models.CASCADE)
    preferred_location = models.JSONField(default=dict)
    preferred_indoor_activities = models.JSONField(default=dict)
    preferred_outdoor_activities = models.JSONField(default=dict)
    preferred_cuisine = models.ManyToManyField(Cuisine)
    preferred_entertainment = models.ManyToManyField(Entertainment)
    preferred_weather = models.ManyToManyField(Weather)
    preferred_time = models.ManyToManyField(TimeOfDay)
    updated_at = models.DateTimeField(auto_now=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} Preferences"


class UserRecommendationHistory(models.Model):
    id = models.UUIDField(primary_key=True, editable=False, unique=True, default=uuid.uuid4)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    recommendation = models.JSONField(default=dict)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user.username} Recommendation History"
