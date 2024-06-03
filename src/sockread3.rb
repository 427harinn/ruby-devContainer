require 'socket'

TCPSocket.open("www.is.kyusan-u.ac.jp",80) do |s|

    s.print "HEAD /~toshi/ HTTP/1.0\r\n"
    s.print "\r\n"

    while line=s.gets
        puts line
    end
end