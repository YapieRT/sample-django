#!/bin/bash

python manage.py migrate
python manage.py createsuperuser --username superpuperuser --noinput
python manage.py runserver 0.0.0.0:8000
