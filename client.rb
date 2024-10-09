require 'socket'

BUFFER_SIZE = 1024
HOSTNAME = '192.168.29.251'
PORT = 4321

socket = UDPSocket.new
socket.bind('0.0.0.0', 0)

Thread.new do
  loop do
    message, _ = socket.recvfrom(BUFFER_SIZE)
    puts "#{message.strip}"
  end
end

loop do
  message = gets.chomp
  socket.send(message,0,HOSTNAME,PORT)
end
