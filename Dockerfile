FROM python:3.8-slim

ENV DockerHOME=/home/app/webapp

RUN mkdir -p $DockerHOME

WORKDIR $DockerHOME

COPY . $DockerHOME

RUN pip install --upgrade pip && pip install -r requirements.txt && python manage.py collectstatic --noinput

RUN useradd -r -s /bin/false app && chown -R app:app /home/app

USER app

EXPOSE 8000

ENTRYPOINT ["./startup.sh"]