require 'pdf-reader'

#get Data from last page of document
file = '/home/adhandav/Downloads/CNT2677568.pdf'

if File.exist?(file)
    reader = PDF::Reader.new(file)
    pc = reader.page_count
    page   = reader.page(pc)
    data = page.text

    #search for particular string
    # positions = data.gsub(/Total Comments:/).map { Regexp.last_match.begin(0) }
    # puts positions

    puts data.split("\s")

end