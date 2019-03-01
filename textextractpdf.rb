require 'pdf-reader'

file = '/home/adhandav/Downloads/pdf.pdf'

        if File.exist?(file)
            reader = PDF::Reader.new(file)
            pc = reader.page_count
            while pc > 0
                page = reader.page(pc)
                data = page.text
                array=data.split("\s")
                if (array.index("Markup").to_i+2) == (array.index("Summary").to_i+1) && (array.index("Sheet").to_i)  
                    puts pc
                end
                pc-=1 
            end
        else
            puts "File does not exists"
        end