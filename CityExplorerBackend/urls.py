"""
URL configuration for City_Explorer_Backend project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
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