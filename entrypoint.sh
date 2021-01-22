#!/usr/bin/bash

gunicorn swapi.wsgi --bind 0.0.0.0:8000
