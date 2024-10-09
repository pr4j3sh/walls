require 'socket'

BUFFER_SIZE = 1024

HOSTNAME = '192.168.29.251'
# print 'server ip > '
# HOSTNAME = gets.chomp
PORT = 4321


socket = UDPSocket.new
socket.bind('0.0.0.0', 0)

assigned_port = socket.addr[1]

user = "#{HOSTNAME}:#{assigned_port}"

puts "connected to server @ #{HOSTNAME}:#{PORT} as #{user}"

Thread.new do
  loop do
    message, _ = socket.recvfrom(BUFFER_SIZE)
    author, _ = message.strip.split(' > ', 2)
    if author != user
      puts "\n#{message.strip}"
    end
  end
end

loop do
  print 'you > '
  message = gets.chomp
  socket.send(message,0,HOSTNAME,PORT)
end
