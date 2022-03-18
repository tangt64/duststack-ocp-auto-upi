#!/usr/bin/python3.6
from http.server import HTTPServer, SimpleHTTPRequestHandler
import os

server_address = ('0.0.0.0', {{ web_port }})
httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
os.chdir('/tmp/ocp-upi/root')  # optional
print('Running server...')
httpd.serve_forever()
