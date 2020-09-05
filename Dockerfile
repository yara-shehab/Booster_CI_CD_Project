FROM ubuntu
RUN apt-get update -qq
RUN apt-get -y install python3.6
RUN apt-get -qqy install python3-pip
FROM python:3.6-buster
ADD . /simpleApp
WORKDIR /simpleApp
RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
EXPOSE 8000
CMD ["python3.6", "manage.py" ,"runserver" ,"0.0.0.0:8000"]
