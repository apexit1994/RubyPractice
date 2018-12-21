the_count = [1, 2, 3, 4, 5]

for numbers in the_count
    puts numbers
end

the_count.each do |count|
    puts count
end

the_count.each {|i| puts i}

elements= []

(0..5).each do |i|
    elements.push(i)
end

elements.each {|i| puts i}

