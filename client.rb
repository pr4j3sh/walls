require 'socket'

BUFFER_SIZE = 1024

print 'server ip > '
HOSTNAME = gets.chomp
PORT = 4321

def local_ip
  Socket.ip_address_list.detect(&:ipv4_private?).ip_address
end

socket = UDPSocket.new
socket.bind(local_ip, 0)

assigned_port = socket.addr[1]

user = "#{local_ip}:#{assigned_port}"

socket.send('ping',0,HOSTNAME,PORT)
puts "connected to server @ #{HOSTNAME}:#{PORT} as #{user}"
puts "start texting..."

Thread.new do
  loop do
    message, _ = socket.recvfrom(BUFFER_SIZE)
    author, _ = message.strip.split(' > ', 2)
    if author != user
      puts "#{message.strip}"
    end
  end
end

loop do
  message = gets.chomp
  socket.send(message,0,HOSTNAME,PORT)
end
