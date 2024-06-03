require 'socket'

TCPSocket.open("www.is.kyusan-u.ac.jp",80) do |s|

    s.print "GET /\r\n"

    while line=s.gets
        puts line
    end
end