#! /usr/bin/env ruby

require 'socket'

gs = TCPServer.open(5000)


while true
    s1 = gs.accept
    Thread.new(s1) do |s|
        s.puts "HTTP/1.1 200 OK"
        s.puts
        while line = s.gets
            line.chomp!
            break if line == ""
            #puts(line)
            s.puts(line)
            puts line
        end
        sleep 20
    end
end
gs.close