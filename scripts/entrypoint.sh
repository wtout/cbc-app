#!/bin/bash

# Install dependencies
echo "Installing dependencies..."
pip install --no-cache-dir -r requirements.txt --timeout=60

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate

# Start server
echo "Starting server..."
python manage.py runserver 0.0.0.0:8000