#!/usr/bin/env ruby

require 'socket'
require 'json'

# サーバーがリスニングするポートを設定
gs = TCPServer.open(5000)

# 無限ループでクライアントからの接続を待ち受け
while true
  s1 = gs.accept
  Thread.new(s1) do |s|
    # リクエストの最初の行を取得
    request_line = s.gets
    if request_line
      cmd, path, *dummy = request_line.split(" ")
      while line = s.gets
        line.chomp!
        break if line == ""
      end

      # HTTPレスポンスの基本情報を準備
      s.puts "HTTP/1.1 200 OK"
      s.puts "Content-Type: application/json"
      s.puts

      # パスに応じたJSONデータを送信
      case path
      when "/data1"
        if File.exist?("free/data1.json")
          s.puts File.read("free/data1.json")
        else
          s.puts({ error: "data1.json not found" }.to_json)
        end
      when "/data2"
        if File.exist?("free/data2.json")
          s.puts File.read("free/data2.json")
        else
          s.puts({ error: "data2.json not found" }.to_json)
        end
      else
        s.puts "HTTP/1.1 404 Not Found"
        s.puts "Content-Type: application/json"
        s.puts
        s.puts({ error: "404 Not Found" }.to_json)
      end
    end

    s.close
  end
end
gs.close
