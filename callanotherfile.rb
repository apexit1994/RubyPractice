require './readpdf'

obj = MarkupFunctions.new '/home/adhandav/Downloads/adobe_markup (2).pdf'
datalist, header_metadata= obj.extractPDFText

puts "HEADER META DATA\n\n"
puts "Total Comments: " + header_metadata.total_comments
puts "Doc Number: " + header_metadata.doc_number
puts "Project: " + header_metadata.project
puts "REV VER TITLE\n" + header_metadata.revision_version_title

puts "\n\n"

puts "COMMENTS\n\n"
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
