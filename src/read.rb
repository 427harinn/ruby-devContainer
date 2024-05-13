#1.行の先頭に'#'を追加して表示
#2.行の先頭に行番号を追加して表示する
#3.行の末尾に？を追加して表示する
#
f = File.open "output.txt","r"

i = 1
while line = f.gets
    line = line.chomp
    puts i.to_s + "." + line + "?"
    i += 1
end

f.close