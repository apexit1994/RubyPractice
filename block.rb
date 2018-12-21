def test
    i=8
    puts "this is method"
    yield i
end

BEGIN {
    puts "start"
}

END{
    puts "end"
}

test {
    |i|
    puts "this is block #{i}"
}
