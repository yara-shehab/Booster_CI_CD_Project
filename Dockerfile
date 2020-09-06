FROM python:3.6-buster


ADD . /simpleApp
WORKDIR /simpleApp
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate


EXPOSE 8000
CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]
