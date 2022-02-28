# Использовать официальный образ родительского образа / слепка.
FROM ubuntu:18.04
#FROM python:3.9-alpine
# Установка рабочей директории, откуда выполняются команды внутри контейнера.
WORKDIR /progect_1
# Скопировать все файлы с локальной машины внутрь файловой системы виртуального образа.
COPY ./progect_1 /progect_1

RUN apt-get update
RUN apt-get -y install python3-pip
RUN apt install htop
RUN pip3 install --upgrade pip
RUN pip3 install django-filter
# Запустить команду внутри образа, установка зависимостей.
RUN pip3 install -r /progect_1/requirements.txt
# Выполнить команду внутри контейнера
EXPOSE 8000
#CMD gunicorn my_proj.wsgi -b 0.0.0.0:8000
CMD ["python3", "/progect_1/manage.py", "migrate"]
CMD ["python3", "/progect_1/manage.py", "runserver", "0.0.0.0:8000"]
