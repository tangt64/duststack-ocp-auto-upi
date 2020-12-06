#!/usr/bin/python3.6
from http.server import HTTPServer, SimpleHTTPRequestHandler
import os

server_address = ('0.0.0.0', 8080)
httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
os.chdir('/tmp/root')  # optional
print('Running server...')
httpd.serve_forever()
