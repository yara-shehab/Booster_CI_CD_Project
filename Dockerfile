FROM ubuntu 
RUN apt-get update -qq
RUN apt-get install python3.6
RUN apt-get install python3-pip3
ADD ./simpleApp /
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD ["python3.6 manage.py runserver 0.0.0.0:8000"]
