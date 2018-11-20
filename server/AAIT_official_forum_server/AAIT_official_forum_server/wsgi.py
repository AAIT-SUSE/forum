"""
WSGI config for AAIT_official_forum_server project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/howto/deployment/wsgi/
"""

import os
import sys
PROJECT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__name__)))
sys.path.insert(0,PROJECT_DIR)
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "AAIT_official_forum_server.settings")

from django.core.wsgi import get_wsgi_application

application = get_wsgi_application()
