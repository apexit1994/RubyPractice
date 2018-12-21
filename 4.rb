txt = open (ARGV.first )
puts "content: #{txt.readline}"
txt.close


def sample
    puts "in the function"
end

sample


if 1>5
    print 1
elseif  2>5
    print 2
else
    print 5
end