require 'socket'

BUFFER_SIZE = 1024
HOSTNAME = '127.0.0.1'
PORT = 4321

socket = UDPSocket.new
socket.bind(HOSTNAME,PORT)

loop do
  message, sender = socket.recvfrom(BUFFER_SIZE)
  port = sender[1]
  host = sender[2]
  socket.send(message.upcase, 0, host,port)
end
