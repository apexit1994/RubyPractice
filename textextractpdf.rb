require 'pdf-reader'

file = '/home/adhandav/Downloads/CNT2677568 (2).pdf'

        if File.exist?(file)
            reader = PDF::Reader.new(file)
            pc = reader.page_count
            page   = reader.page(pc)
            data = page.text

            array=data.split("\s")

            puts array
        else
            puts "File does not exists"
            
        end