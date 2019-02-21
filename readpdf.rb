require 'pdf-reader'

class MarkupSummaryData

    def getTotalComments(markupSummary)

        array=markupSummary.split("\s")
        $i=0;
        $length = array.length
        while $i < $length-3 do
            if (array[$i] == "Total") && (array[$i+1] == "Comments:")
                return "Total Comments :"+array[$i+2]
            end
            $i+=1
        end
    end

    def getMarkupList(markupSummary)

        array=markupSummary.split("\s")
        $i=0;
        $length = array.length
        while $i < $length-3 do
            if (array[$i] == "ID") && (array[$i+1] == "Type") && (array[$i+2] == "Comments")
                
            end
            $i+=1
        end
        
    end

    def extractPDFText
        #get Data from last page of document
        file = '/home/adhandav/Downloads/CNT2677568.pdf'

        if File.exist?(file)
            reader = PDF::Reader.new(file)
            pc = reader.page_count
            page   = reader.page(pc)
            data = page.text
            puts getTotalComments(data)
            getMarkupList(data)
        else
            puts "File does not exists"
            
        end
    end

end

obj = MarkupSummaryData.new
obj.extractPDFText



