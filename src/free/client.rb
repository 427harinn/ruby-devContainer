require 'socket'
require 'json'

# サーバーに接続
TCPSocket.open("localhost", 5000) do |s|
  # リクエストを送信
  s.print "GET /data1 HTTP/1.0\r\n"
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
      
      # JSONデータに応じた内容をコンソールに表示
      if data["time"]
        puts "Current Time: #{data["time"]}"
      elsif data["name"] && data["email"]
        puts "ID: #{data["id"]}, Name: #{data["name"]}, Email: #{data["email"]}"
      elsif data["name"]
        puts "Name: #{data["name"]}"
      else
        puts "Error: #{data["error"]}"
      end
    rescue JSON::ParserError => e
      puts "Error parsing JSON: #{e.message}"
    end
  end
end
