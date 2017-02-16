import os
import pydap
from flask import Flask
from pydap.wsgi.app import DapServer

app_debug = (os.environ.get('APP_DEBUG', 'False').lower() in ['true', 'yes', 'y', '1'])
app_path = os.environ.get('APP_PATH', 'data/')
app_host = os.environ.get('APP_HOST', '0.0.0.0')
app_port = int(os.environ.get('APP_PORT', '8080'))

app = Flask(__name__)
app.wsgi_app = DapServer(app_path, 'templates/')

if __name__ == "__main__":
   app.run(host=app_host, debug=app_debug, port=app_port) 
