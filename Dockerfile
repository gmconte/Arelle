FROM python:3-alpine

WORKDIR /usr/src/app

#RUN apt-get update -y
#RUN apt-get upgrade -y
#RUN apt-get install unixodbc-dev gcc -y
RUN apk  add --update --no-cache unixodbc-dev gcc

ADD requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
ADD arelleCmdLine.py /usr/src/app
ADD arelle /usr/src/app/arelle

CMD ["python", "arelleCmdLine.py", "--webserver=0.0.0.0:8080"]
EXPOSE 8080
