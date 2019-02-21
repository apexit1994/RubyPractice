require 'pdf-reader'

class MarkupSummaryData

    attr_accessor :type, :comments, :username, :time
    def initialize( type, comments, username, time)
        # local variables shadow the reader methods
        @type = type
        @comments = comments
        @username = username
        @time = time
    end

    def getTotalNumberOfComments(markupSummary)
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

        index=0,id=1,type,comments="",username="",time
        array=markupSummary.split("\s")
        $i=0;
        $length = array.length
        while $i < $length-3 do
            if (array[$i] == "ID") && (array[$i+1] == "Type") && (array[$i+2] == "Comments")
                index=$i
            end
            $i+=1
        end

        index+=3
        
        while (index < $length)
            if(id == array[index].to_i)
                index+=1
            end

            type=array[index]
            index+=1

            while(array[index] != "-" && !array[index + 1].match(/M[rs]+[s]*/))
               comments+=array[index]
               index+=1 
            end

            index+=1

            while(array[index] != "on")
                username += array[index]
                index+=1
            end
            index+=1
            time = array[index]
            puts type
            puts comments
            puts username
            puts time

            index+=1
            id+=1
            type="",comments="",username="",time=""
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
            puts getTotalNumberOfComments(data)
            getMarkupList(data)
        else
            puts "File does not exists"
            
        end
    end

end

obj = MarkupSummaryData.new 1,2,3,4
obj.extractPDFText



