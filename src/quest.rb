#数当てゲーム
#1.乱数(1〜10)を作って変数に代入
#2.その値を表示

random = rand(1..10)
puts random

#1.ユーザから数を入力してもらう
#2.その数が乱数と同じなら「正解」違ったら「間違い」と表示

num = gets.to_i

if random == num
  puts "正解"
else
  puts "不正解"
end

#1.その数が乱数より大きかったら大きい、小さかったら小さいと表示
#2.不正解だったら再入力
num2 = gets.to_i
while random != num2
if num2 > random
  puts "大きい"
else
  puts "小さい"
end
num2 = gets.to_i
end
puts "正解"