def max a,b
  if a>b
    return a
  else
    return b
  end
end

def min a,b
  result = a
  if b<a
    result = b
  end
  return result
end


puts max(10,3.3)
puts min(30,41)