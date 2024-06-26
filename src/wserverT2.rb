#! /usr/bin/env ruby

require 'socket'

gs = TCPServer.open(5000)


while true
    s1 = gs.accept
    Thread.new(s1) do |s|
        cmd,path,*dummy = s.gets.split(" ")
        while line = s.gets
            line.chomp!
            break if line == ""
        end
        s.puts "HTTP/1.1 200 OK"
        s.puts 
        s.puts cmd
        s.puts path
        
        if path == "/now"
          s.puts Time.now
        else
          s.puts "Hello"
        end
        
        s.close
    end
end
gs.close