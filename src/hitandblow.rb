def rands(n,m)
    randoms = rand(1..n)
    i = 0
    while i < m
        while randoms[i] == tmp
            tmp = rand(1..n)
        end
        randoms << tmp
        puts randoms[i].to_s + ","
        i+=1
    end
end

puts(rands(9,4))

