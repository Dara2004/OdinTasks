require 'socket'

host = 'www.google.com'
port = '80'
path = "/index.htm"

req = "GET #{path} HTTP/1.0\r\n\r\n"

the_socket = TCPSocket.open(host,port)

the_socket.print(req)  #this sends request

response = the_socket.read

headers, body = response.split("\r\n\r\n", 2) 

print body


