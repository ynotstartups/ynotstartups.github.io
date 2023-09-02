# TIL - Command env for printing environment variabls in shell       - 08/Aug/23

```bash
$ docker run ubuntu env
```

```bash
$ env

PYTHONUNBUFFERED=1
CELERY_BROKER_URL=amqp://guest:guest@rabbitmq:5672//
CHOKIDAR_USEPOLLING=true
HOSTNAME=af072bc9372e
PYTHON_VERSION=3.8.17
CELERY_RESULT_BACKEND=django-db
PWD=/app/backend
PYTHON_SETUPTOOLS_VERSION=57.5.0
HOME=/root
LANG=C.UTF-8
AWS_SECRET_ACCESS_KEY=
ONEVIEW_ENV=DEV
TERM=xterm
SHLVL=1
AWS_ACCESS_KEY_ID=
PYTHON_PIP_VERSION=23.0.1
PYTHON_GET_PIP_SHA256=96461deced5c2a487ddc65207ec5a9cffeca0d34e7af7ea1afc470ff0d746207
PYTHON_GET_PIP_URL=https://github.com/pypa/get-pip/raw/0d8570dc44796f4369b652222cf176b3db6ac70e/public/get-pip.py
PATH=/root/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
AWS_SESSION_TOKEN=
_=/usr/bin/env
```
