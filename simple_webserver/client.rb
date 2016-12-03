require 'socket'
require 'json'
require 'uri'

$the_socket = TCPSocket.open('localhost',2000)

def request_selection
    puts "type GET if you want to get or POST if you want to post"
	
	picked = false
	input = nil

    while picked == false
    	input = gets.chomp
    	picked = true if input == 'GET' || input == 'POST'
    	puts "Please type only 'POST' or 'GET' in CAPITAL" if input != 'get' || input.upcase != 'post'
    end

    if input == 'GET' || input == 'get'
    	puts "GET activated\n"
        activate_get 
    elsif input == 'POST' || input == 'post'
    	puts "POST activated\n"
        activate_post 
    end

    status = $the_socket.read

    puts File.readlines('generated_thanks.erb.html') if input == 'POST' && status.split[1].to_i == 200

    puts status if input != 'POST'
    puts status

end


def activate_get
	request = "GET /index.html HTTP/1.0\r\n\r\n"
	$the_socket.print(request)

end

def activate_post
    puts "IN POST" 
	json_string = input_and_json
	request = "POST /thanks.html HTTP/1.0\r\n " + 
	          "From: Local User\r\n" +
	          "User-Agent: HTTPTool/1.0\r\n" +
	          "Content-Type: application/x-www-form-urlencoded\r\n" +
	          "Content-Length: #{json_string.length}\r\n" + 
	          json_string + "\r\n"

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


request_selection











