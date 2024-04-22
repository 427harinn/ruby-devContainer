i=0
while i<10
    print "#"
    i+=1
end

#putsは改行println的な
puts

a=[1,3,10,7]
b=[a,"aaa",2+1]
pp b

i=0
while i<a.length
  print a[i].to_s + ","
  i+=1
end
puts
a.each do |x|
  print x.to_s + ":"
end
puts

a.each_with_index do |x,idx|
  print x.to_s + ":" + idx.to_s + ","
end

puts

5.times do |i|
  print i.to_s
end

puts