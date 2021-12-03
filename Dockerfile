FROM python:3.7.3

ADD requirements.txt /

RUN pip install -r /requirements.txt &&\
    apt-get update -y &&\
    apt-get install -y p7zip-full

ADD . /app

WORKDIR /app/model/down
RUN 7z e cafe.7z.001

WORKDIR /app

EXPOSE 33507
CMD [ "python" , "app.py"]