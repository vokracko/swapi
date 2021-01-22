FROM python:2

ENV PYTHONUNBUFFERED 1
RUN mkdir -p /app
WORKDIR /app
RUN apt-get update && apt-get install -y libmemcached-dev
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
COPY pyproject.toml poetry.lock ./
RUN /root/.poetry/bin/poetry config virtualenvs.create false
RUN /root/.poetry/bin/poetry install

COPY swapi ./swapi
COPY resources ./resources
COPY manage.py entrypoint.sh ./

RUN /app/manage.py migrate
RUN /app/manage.py loaddata resources/fixtures/*

ENTRYPOINT ["bash", "/app/entrypoint.sh"]
