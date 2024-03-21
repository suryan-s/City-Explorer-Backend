from django.urls import path

from LocationDataManager.views import LocationInfoView

urlpatterns = [
    path('info', LocationInfoView.as_view()),
]
