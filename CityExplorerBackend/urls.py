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
]

if os.environ.get('ENVIRONMENT') != 'PRODUCTION':
    urlpatterns.append(path('admin/', admin.site.urls))