class Person
  def initialize name,age
    @name = name
    @age = age
  end

  def disp
    puts @name + ":" + @age.to_s
  end
end

p1= Person.new("toshi",18)
p1.disp()