#! /usr/bin/env ruby

require 'socket'

gs = TCPServer.open(5000)


while true
    s = gs.accept
    s.puts "HTTP/1.1 200 OK"
    s.puts
    while line = s.gets
        line.chomp!
        break if line == ""
        #puts(line)
        s.puts(line)
    end
    s.close

    #sleep 20
end
gs.close