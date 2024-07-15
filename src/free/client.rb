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

  #デバッグ用
  #puts "Response received:"
  #puts response.inspect

  #ヘッダーとボディを分離
  headers, body = response.split("\n\n")


  if body.nil?
    puts "Error: Response body is nil"
  else
    begin
      #json形式に変換
      data = JSON.parse(body)

      puts "パスワードを入力してください:"
      pass = $stdin.gets.chomp

      if pass == data["pass"]
        
        if data["count"] == 0
          puts "#{data["name"]}さん初めての訪問です！"
        else
          puts "#{data["name"]}さん#{data["count"] + 1}回目の訪問です！"
        end
        
        #訪問回数を上書き
        data["count"] = data["count"] + 1

        #jsonに書き込み
        File.open("free/#{data["id"]}.json", "w") { |f| JSON.dump(data, f) }

        finish = false
        while finish == false
        puts "何をしますか？ 1.メールアドレス確認 2.パスワード変更 3.終了:"
        input = $stdin.gets.chomp
        if input == "1"
          puts "あなたのメールアドレスは「#{data["email"]}」です。"
        elsif input == "2"
          puts "変更後のパスワードを入力してください。"
          data["pass"] = $stdin.gets.chomp
          #jsonに書き込み
          File.open("free/#{data["id"]}.json", "w") { |f| JSON.dump(data, f) }
          puts "パスワードが変更されました。"
        elsif input == "3"
          puts "終了します。"
          finish = true
        else
          puts "実行できません"
        end
      end
        else
          puts "パスワードが違います"
      end
    
      
    rescue JSON::ParserError => e
        #JSON形式に変換できる形で送られてきていない場合
      puts "そのIDは存在しません。"
    end
  end
end
