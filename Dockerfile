FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

RUN python manage.py migrate

EXPOSE 8000
CMD ["python", "manage.py", "runserver","0.0.0.0:8000"]