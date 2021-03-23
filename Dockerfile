FROM python:3.9.2-alpine3.13
WORKDIR /root
RUN apk add --no-cache --virtual .build-deps \
    gcc=10.2.1_pre1-r3 libc-dev=0.7.2-r3 linux-headers=5.7.8-r0
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py wsgi.py /root/
COPY templates /root/templates
CMD uwsgi --socket 0.0.0.0:5000 --protocol=http -w wsgi:app