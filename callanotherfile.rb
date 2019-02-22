require './readpdf'

obj = MarkupFunctions.new '/home/adhandav/Downloads/CNT2677568 (2).pdf'
datalist, totalcomments= obj.extractPDFText

# puts totalcomments

for i in datalist
  puts i.type
  puts i.comments
  puts i.username
  puts i.time
  for j in i.replies
    puts "------reply------"
    puts j.reply
    puts j.username
    puts j.time
  end
  puts ""
end
