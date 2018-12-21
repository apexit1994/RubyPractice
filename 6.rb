i=0

numbers = []

while i<6
    numbers.push(i)
    i+=1
end

puts numbers[5]

puts defined?Class == "constant"

ten_things = "Apples Oranges Crows Telephone Light Sugar"

stuff = ten_things.split(' ')

puts stuff[5]

hash={"name"=>"Zed", "age"=>39, "height"=>74}

puts hash['age']

