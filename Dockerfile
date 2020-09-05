
FROM ubuntu 

ADD ./simpleApp /

RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD ["python3.6", "manage.py" ,"runserver" ,"0.0.0.0:8000"]

