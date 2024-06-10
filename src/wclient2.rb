#! /usr/bin/env ruby
#
#ruby wclient2.rb http://www.is.kyusan-u.ac.jp/~toshi/index.html
#
#scheme://host/path
#


require 'socket'

#TCPSocket.open("www.is.kyusan-u.ac.jp",80) do |s|

url = ARGV[0]
scheme,dummy,host,*path = url.split("/")

path = "/" + path.join("/")

path += "/" if url.end_with?("/")


puts(host)
puts(path)

TCPSocket.open(host,80) do |s|
    s.puts "GET #{path} HTTP/1.1\r\n"
    s.puts "Host: #{host}\r\n"
    s.puts "\r\n"
    existence = false

    while line=s.gets &. chomp
          if line == ""
                existence = true
          end
          if existence
            puts line
          end
    end
end