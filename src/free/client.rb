require 'socket'

TCPSocket.open("localhost",5000) do |s|

    s.print "GET /non HTTP/1.0\r\n"
    s.print "\r\n"

    while line=s.gets
        puts line
    end
end