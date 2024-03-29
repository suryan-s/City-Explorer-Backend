"""
URL configuration for CityExplorerBackend project.
"""
import os

from django.contrib import admin
from django.http import JsonResponse
from django.urls import path, include

urlpatterns = [
    path('health', lambda request: JsonResponse({'status': 'ok'})),
    path('api/v1/auth/', include('AuthManager.urls')),
    path('api/v1/user/', include('UserManager.urls')),
    path('api/v1/location/', include('LocationDataManager.urls')),
    path('api/v1/weather/', include('WeatherDatamanager.urls')),
    path('api/v1/recommendation/', include('RecommendationManager.urls')),
]

if os.environ.get('ENVIRONMENT') != 'PRODUCTION':
    urlpatterns.append(path('admin/', admin.site.urls))
