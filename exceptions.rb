begin  
    puts 'I am before the raise.'  
    raise 'An error has occurred.'  
    puts 'I am after the raise.'  
 rescue  Exception => e
    puts e.message
 ensure
    puts "I am sure"
 end  
 puts 'I am after the begin block.'  

 def promptAndGet(prompt)
    print prompt
    res = readline.chomp
    throw :lable if res == "!"
    return res
 end
 
 catch :lable do
    name = promptAndGet("Name: ")
    age = promptAndGet("Age: ")
 end
 promptAndGet("Name:")