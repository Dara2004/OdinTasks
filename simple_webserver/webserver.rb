require 'socket'
require 'uri'
require 'json'
require 'erb'

CONTENT_TYPE = {
  'html' => 'text/html',
  'txt' => 'text/plain',
  'png' => 'img/png',
  'jpg' => 'image/jpeg'
}

def find_path(http_path)
  file = http_path.split[1].gsub('/','')
  return file
end

def type_of_content(http_path)
  type = http_path.split('.')[1]
  return type
end

server = TCPServer.new('2000')

loop do
  ispost = false
  client = server.accept  #wait for client to connect

  requested_http = client.gets  #requests for the http response
 

  requested_file = find_path(requested_http)  #returns the path, eg:'index.html'

  ispost = true if requested_http.split[0] == 'POST' #a bool detector if it is a POST or GET



  file_type = type_of_content(requested_file)#finds the file such as .html or .jpg

  if File.exist?(requested_file) && CONTENT_TYPE.include?(file_type)
    file = File.open(requested_file)
    puts "initialize"



    if ispost == true
       from = client.gets
       user_agent = client.gets
       content_type = client.gets
       content_client = client.gets
       json_string = client.gets

        json_file = json_string
        params = JSON.parse(json_file)
        puts requested_file

     erb_file = ERB.new(File.open(requested_file).read)   #reads whatever is the requested file
     @vikings = params["viking"]["name"],params["viking"]["email"]
     letter = erb_file.result binding

     file = File.open('generated_thanks.erb.html', 'w+')

     file.write(letter)

   end
    
    client.print "HTTP/1.1 200 OK\r\n" +
                   "Content-Type: #{CONTENT_TYPE[file_type]}\r\n" +
                   "Content-Length: file.size\r\n" +
                   "Connection: close\r\n"

    client.print "\r\n" 
    file.close
    
  else
    message = "404 File not Found!\n"

    client.print "HTTP/1.1 404 Not Found\r\n" +
                 "Content-Type: text/plain\r\n" +
                 "Content-Length: #{message.size}\r\n" +
                 "Connection: close\r\n"
    client.print "\r\n"
    client.print message

  end
  puts "SUCCESS?"
  client.close
end