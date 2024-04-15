i = gets.to_i
if i%2 == 0
    puts "Even"
else 
    puts "Odd"
end

if i%3==0
    puts "zero"
elsif i%3==1
    puts "one"
else
    puts "two"
end

puts "Even" if i%2==0
puts "Odd" unless i%2==0

case i%5
when 4
    puts "FOUR"
when 3
    puts "THREE"
else
    puts "OTHER"
end