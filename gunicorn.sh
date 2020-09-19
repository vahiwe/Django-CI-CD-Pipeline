#!/bin/sh

source env/bin/activate

python3 manage.py makemigrations

python3 manage.py migrate

python3 manage.py collectstatic --noinput

sudo cp -rf gunicorn.service /etc/systemd/system/

sudo systemctl daemon-reload

sudo systemctl start gunicorn

echo "Gunicorn has started."

sudo systemctl enable gunicorn

echo "Gunicorn has been enabled."

sudo systemctl status gunicorn

sudo systemctl restart gunicorn