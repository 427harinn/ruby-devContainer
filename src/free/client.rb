require 'socket'
require 'json'


puts "IDを入力してください:"
id = $stdin.gets.chomp

# サーバーに接続
TCPSocket.open("localhost", 5000) do |s|
  # リクエストを送信
  s.print "GET /#{id} HTTP/1.0\r\n"
  s.print "\r\n"

  # レスポンスを受信
  response = ""
  while line = s.gets
    response += line
  end

  # デバッグ用にレスポンス全体をエスケープシーケンスを含む形で表示
  #puts "Response received:"
  #puts response.inspect

  # ヘッダーとボディを分離
  headers, body = response.split("\n\n")


  # ボディが nil でないことを確認
  if body.nil?
    puts "Error: Response body is nil"
  else
    # ボディをJSONとして解析
    begin
      data = JSON.parse(body)

      puts "パスワードを入力してください:"
      pass = $stdin.gets.chomp

      if pass == data["pass"]
        if data["count"] == 0
          puts "#{data["name"]}さん初めての訪問です！"
        else
          puts "#{data["name"]}さん#{data["count"] + 1}回目の訪問です！"
        end
        data["count"] = data["count"] + 1

        File.open("free/#{data["id"]}.json", "w") { |f| JSON.dump(data, f) }

      else
        puts "パスワードが違います"
      end
      
    rescue JSON::ParserError => e
        #JSON形式で送られてきていない場合
      puts "そのIDは存在しません。"
    end
  end
end
