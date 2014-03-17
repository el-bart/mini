#!/usr/bin/python
#
# http://wiki.python.org/moin/BaseHttpServer
#
import BaseHTTPServer

host = "0.0.0.0"
port = 11180
page = 
        "<html><head><title>Hello HTTP World</title></head>"
        "<body><p>I'm alive!</p>"
        "<p>path: %s</p>"
        "</body></html>"

class HttpHandler(BaseHTTPServer.BaseHTTPRequestHandler):

    def do_HEAD(s):
        s.send_response(200)
        s.send_header("Content-type", "text/html")
        s.end_headers()

    def do_GET(s):
        """Respond to a GET request."""
        s.do_HEAD(s)
        s.wfile.write(page)
        s.wfile.write("<html><head><title>Hello HTTP World</title></head>")
        s.wfile.write("<body><p>I'm alive!</p>")
        # If someone went to "http://something.somewhere.net/foo/bar/",
        # then s.path equals "/foo/bar/".
        s.wfile.write("<p>path: %s</p>" % s.path)
        s.wfile.write("</body></html>")


server_class = BaseHTTPServer.HTTPServer
httpd = server_class((HOST_NAME, PORT_NUMBER), MyHandler)
httpd.serve_forever()
