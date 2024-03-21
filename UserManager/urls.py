from django.urls import path

from UserManager.views import UserInfoView, UserRecommendationHistoryView, UserPreferencesView

urlpatterns = [
    path('info', UserInfoView.as_view()),
    path('recommendation/history', UserRecommendationHistoryView.as_view()),
    path('preferences', UserPreferencesView.as_view())
]
