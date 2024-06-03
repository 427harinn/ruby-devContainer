#ruby wclient.rb　ホスト名　パス名　で実行して画面にそのページの内容を表示
#例
#ruby wclient.rb www.is.kyusan-u.ac.jp /~toshi/
#ヒント:
#ARGV[1]とか使うよ

require 'socket'

#TCPSocket.open("www.is.kyusan-u.ac.jp",80) do |s|
TCPSocket.open("#{ARGV[0]}",80) do |s|

    s.print "GET #{ARGV[1]} HTTP/1.0\r\n"
    s.print "\r\n"
    
    existence = false

    while line=s.gets
          if line == "\r\n"
                existence = true
          end
          if existence
            puts line
          end
    end
end