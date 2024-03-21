"""
ASGI config for City_Explorer_Backend project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/howto/deployment/asgi/
"""

import os

from django.core.asgi import get_asgi_application
from dotenv import load_dotenv

load_dotenv()

if os.environ.get('ENVIRONMENT') == 'PRODUCTION':
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'City_Explorer_Backend.prod_settings')
else:
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'City_Explorer_Backend.dev_settings')

application = get_asgi_application()
