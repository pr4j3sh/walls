require 'socket'

BUFFER_SIZE = 1024
PORT = 4321

def local_ip
  Socket.ip_address_list.detect(&:ipv4_private?).ip_address
end

HOSTNAME = local_ip

socket = UDPSocket.new
socket.bind(HOSTNAME,PORT)

puts "server running @ #{HOSTNAME} #{PORT}"

clients = []

loop do
  message, sender = socket.recvfrom(BUFFER_SIZE)
  port = sender[1]
  host = sender[2]
  author = "#{host}:#{port}"
  message = message.strip
  
  puts "#{author} > #{message}"

  clients << sender unless clients.include?(sender)

  clients.each do |client|
    cport,chost = client[1], client[2]
    socket.send("#{author} > #{message}",0,chost,cport)
  end
end
