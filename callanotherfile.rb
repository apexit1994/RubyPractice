require './readpdf'

obj = MarkupFunctions.new '/home/adhandav/Downloads/CNT2677568 (2).pdf'
datalist, header_metadata= obj.extractPDFText

puts header_metadata.total_comments
puts header_metadata.doc_number
puts header_metadata.project
puts header_metadata.revision_version_title

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
