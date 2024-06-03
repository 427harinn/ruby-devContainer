require 'socket'

s=TCPSocket.open("www.is.kyusan-u.ac.jp",80)

s.print "GET /\r\n"

while line=s.gets
  puts line
end


s.close