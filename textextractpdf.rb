require 'pdf-reader'

file = '/home/adhandav/Downloads/pdf.pdf'

        if File.exist?(file)
            reader = PDF::Reader.new(file)
            pc = reader.page_count
            while pc > 0
                page = reader.page(pc)
                data = page.text
                array=data.split("\s")
                if (array[0]=="Markup") && (array[1]=="Summary") && (array[2]=="Sheet")   
                    puts pc
                end
                pc-=1 
            end
        else
            puts "File does not exists"
        end