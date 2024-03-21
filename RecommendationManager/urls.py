from django.urls import path

from RecommendationManager.views import RecommendActivityView, ActivityView

urlpatterns = [
    path('current', RecommendActivityView.as_view()),
    path('activity', ActivityView.as_view()),
]
