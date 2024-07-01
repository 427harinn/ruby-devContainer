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

        
        #s.puts "HTTP/1.1 200 OK"
        #s.puts path
        #s.puts cmd

        if path == "/now"
          s.puts "HTTP/1.1 200 OK"
          s.puts
          s.puts Time.now
        elsif path == "/name"
          s.puts "HTTP/1.1 200 OK"
          s.puts
          s.puts "KyushuSangyoUniversity"
        else
          s.puts "HTTP/1.1 404 NotFound"
          s.puts
          s.puts "404 NotFound"
        end
        
        s.close
    end
end
gs.close