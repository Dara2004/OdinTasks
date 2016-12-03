require 'socket'
require 'json'
require 'uri'

$the_socket = TCPSocket.open('localhost',2000)

def request_selection
    puts "type GET if you want to get or POST if you want to post"
	
	picked = false
	input = nil
    unless picked
    	input = gets.chomp
    	picked = true if input.upcase == 'GET' || input.upcase == 'POST'
    	puts "Please type only 'POST' or 'GET'"
    end
    activate_post if input == 'GET' || input == 'get'
    activate_get if input == 'POST' || input == 'post'

    response = the_socket.read
    headers, body = response.split("\r\n\r\n", 2) 

    print body
end


def activate_get
	request = "GET /thanks.html HTTP/1.0\r\n\r\n"
	$the_socket.print(request)

end

def activate_post 
	json_string = input_and_json
	request = "POST /thanks.html HTTP/1.0\r\n " + 
	          "From: Local User\r\n" +
	          "User-Agent: HTTPTool/1.0\r\n" +
	          "Content-Type: application/x-www-form-urlencoded\r\n" +
	          "Content-Length: #{json_string.length}\r\n" + 
	          json_string

	$the_socket.print(request)
	puts "POST SENT!"
end

def input_and_json
	puts "What is your name? "
	name = gets.chomp
	puts "What is your email?"
	email = gets.chomp

	details = {viking: {name: name,email: email } }
	return details.to_json
end












