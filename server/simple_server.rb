require 'socket'        
require 'json'

def get_request(request_path)
  request = request_path[1..-1]
  send_data = ""
  if File.exists?(request)
    File.open(request, "r") do |f|
      content = f.read
      send_data = "HTTP/1.0 200 OK\nDate: #{Time.now}\nContent-Length: #{content.length}\n\n" + content
    end
  else
    send_data = "HTTP/1.0 404 Not Found"
  end
  send_data
end

def post_request(post_data_arr)
  json_data = post_data_arr[1]
  params = JSON.parse(json_data, :symbolize_names => true)
  puts params.inspect
  response = ""
  File.open("thanks.html", "r") do |f|
    response = f.read
  end
  insert = "<li>Name: #{params[:person][:name]}</li><li>Email: #{params[:person][:email]}</li>"
  return "HTTP/1.1 200 OK\nDate: #{Time.now}\n" + response.gsub("<%= yield %>", insert)
end



server = TCPServer.open(2000)  
while connection = server.accept
  client_message = ''
  loop do
    line = connection.gets
    client_message += line
    puts line
    break if line =~ /quit/ 
  end
  parsed_client_message = client_message.split("\n")
  request_type = parsed_client_message[0].split(" ")[0]
  if request_type == 'GET'
    response = get_request(parsed_client_message[0].split(" ")[1])
  elsif request_type == 'POST'
    response = post_request(parsed_client_message)
  end
  connection.puts response
  connection.close
end

