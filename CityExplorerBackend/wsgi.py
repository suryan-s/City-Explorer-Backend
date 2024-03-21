"""
WSGI config for CityExplorerBackend project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application
from dotenv import load_dotenv

load_dotenv()

if os.environ.get('ENVIRONMENT') == 'PRODUCTION':
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'CityExplorerBackend.prod_settings')
else:
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'CityExplorerBackend.dev_settings')

application = get_wsgi_application()
