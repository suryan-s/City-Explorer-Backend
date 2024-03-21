"""
WSGI config for City_Explorer_Backend project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application
from dotenv import load_dotenv

load_dotenv()

if os.environ.get('ENVIRONMENT') == 'PRODUCTION':
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'City_Explorer_Backend.prod_settings')
else:
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'City_Explorer_Backend.dev_settings')

application = get_wsgi_application()
