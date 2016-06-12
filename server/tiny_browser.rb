require 'socket'
require 'json'
 

def get_request_string
  request_string = ""
  person_hash = {person: {}}
  puts "Would you like to GET or POST?"
  get_or_post = gets.chomp.downcase
  if get_or_post == "post"
    puts "What is your name?"
    name = gets.chomp
    person_hash[:person][:name] = name
    puts "What is your email?"
    email = gets.chomp
    person_hash[:person][:email] = email
    request_string = "POST /thanks.html HTTP/1.0
    #{person_hash.to_json}
    quit\n"
  else
    puts "What file would you like to get?"
    response = gets.chomp
    request_string = "GET #{response} HTTP/1.0
    quit\n"
  end
end


host = 'localhost'    
port = 2000                          
               

request = get_request_string

socket = TCPSocket.open(host,port)  
socket.print(request)             
response = socket.read             
print response

