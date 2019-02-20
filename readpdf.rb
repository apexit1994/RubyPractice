require 'pdf-reader'

#get Data from last page of document
reader = PDF::Reader.new('/home/adhandav/Downloads/CNT2677568.pdf')
pc = reader.page_count
page   = reader.page(pc)
data = page.text

#search for particular string
positions = data.gsub(/on/).map { Regexp.last_match.begin(0) }

puts positions