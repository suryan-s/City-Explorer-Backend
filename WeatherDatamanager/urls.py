from django.urls import path

from WeatherDatamanager.views import WeatherInfoView

urlpatterns = [
    path('current', WeatherInfoView.as_view()),
]
