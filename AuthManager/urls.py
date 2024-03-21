from django.urls import path

from AuthManager.views import RegisterView, LoginView, LogoutView, RefreshTokenView

urlpatterns = [
    path('register', RegisterView.as_view()),
    path('login', LoginView.as_view()),
    path('logout', LogoutView.as_view()),
    path('login/refresh', RefreshTokenView.as_view()),
]
