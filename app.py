from flask import Flask
from flask import render_template
from random import randint
import time
from prometheus_flask_exporter import PrometheusMetrics
app = Flask(__name__)
metrics = PrometheusMetrics(app)

#time.sleep(30)

@app.route('/')
def hello_world():
    return render_template('index.html')

@app.route('/one')
def one():
    return 'Hello, one!'

@app.route('/two')
def two():
    time.sleep(5)
    return 'Hello, two!'

@app.route('/three')
def three():
    return 'Hello, three!'

@app.route('/healthz')
def healthz():
    return 'OK!'

@app.route('/test')
def test():
    a = randint(1,3)
    codes = {1: 200, 2: 301, 3:404}
    return 'Hello, test!', codes[a]
