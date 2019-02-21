require 'pdf-reader'

class ReplyList
    attr_accessor :reply, :user, :time_of_reply
    def initialize( type, comments, username, time)
        # local variables shadow the reader methods
        @reply = reply
        @user = user
        @time_of_reply = time_of_reply
    end    
end

class MarkupSummaryData

    attr_accessor :type, :comments, :username, :time, :replies
    def initialize( type, comments, username, time, replies)
        # local variables shadow the reader methods
        @type = type
        @comments = comments
        @username = username
        @time = time
        @replies = replies
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

        index=0,id=1,type,comments="",username="",time, markuplist=[]
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

            markuplist.push(MarkupSummaryData.new type, comments, username, time)
            index+=1
            id+=1
            type="",comments="",username="",time=""
        end

        return markuplist
        
    end

    def extractPDFText
        #get Data from last page of document
        file = '/home/adhandav/Downloads/CNT2677568 (2).pdf'

        if File.exist?(file)
            reader = PDF::Reader.new(file)
            pc = reader.page_count
            page   = reader.page(pc)
            data = page.text
            puts getTotalNumberOfComments(data)
            datalist = getMarkupList(data)

            for i in datalist
                puts i.type
                puts i.comments
                puts i.username
                puts i.time
                puts ""
            end
        else
            puts "File does not exists"
            
        end
    end

end

obj = MarkupSummaryData.new 1,2,3,4
obj.extractPDFText



