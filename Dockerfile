FROM python:3-alpine
WORKDIR /root
RUN apk add --no-cache --virtual .build-deps \
    gcc libc-dev linux-headers
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py wsgi.py /root/
COPY templates /root/templates
ENTRYPOINT ["uwsgi"]
CMD ["--socket 0.0.0.0:5000", "--protocol=http", "-w wsgi:app"]
