require 'pdf-reader'

class ReplyData

  attr_accessor :reply, :username, :time

  def initialize(reply, username, time)
    # local variables shadow the reader methods
    @reply = reply
    @username = username
    @time = time
  end
end

class MarkupSummaryData

  attr_accessor :type, :comments, :username, :time, :replies

  def initialize(type, comments, username, time, replies)
    # local variables shadow the reader methods
    @type = type
    @comments = comments
    @username = username
    @time = time
    @replies = replies
  end
end

class MarkupFunctions

  attr_accessor :file

  def initialize(file)
    # local variables shadow the reader methods
    @file = file
  end

  def getTotalNumberOfComments(markupSummary)
    array = markupSummary.split("\s")
    $i = 0;
    $length = array.length
    while $i < $length - 3 do
      if (array[$i] == "Total") && (array[$i + 1] == "Comments:")
        return "Total Comments :" + array[$i + 2]
      end
      $i += 1
    end
  end

  def getComments(array, index)

    comments = username = ""

    while (array[index] != "-" && !array[index + 1].match(/M[rs]+[s]*/))
      comments = comments + " " + array[index]
      index += 1
    end

    index += 1

    while (array[index] != "on")
      username = username + " " + array[index]
      index += 1
    end
    index += 1
    time = array[index]

    return comments.lstrip, username.lstrip, time, index

  end

  def getMarkupList(markupSummary)

    index = 0, id = 1, type = comments = username = time = "", markuplist = [], replies = []
    array = markupSummary.split("\s")
    $i = 0;
    $length = array.length
    while $i < $length - 3 do
      if (array[$i] == "ID") && (array[$i + 1] == "Type") && (array[$i + 2] == "Comments")
        index = $i
      end
      $i += 1
    end

    index += 3

    while (index < $length)
      if (id == array[index].to_i)
        index += 1
      end

      type = array[index]
      index += 1

      comments, username, time, index = getComments(array, index)

      index += 1

      if array[index] != nil
        while !array[index].match(/[0-9]+/)
          reply, reply_user, reply_time, index = getComments(array, index)
          replies.push(ReplyData.new reply, reply_user, reply_time)
          index += 1
        end
      end
      markuplist.push(MarkupSummaryData.new type, comments, username, time, replies)
      id += 1
      type = comments = username = time = ""
      replies = []
    end

    return markuplist
  end

  def extractPDFText
    #get Data from last page of document
    file = @file

    if File.exist?(file)
      reader = PDF::Reader.new(file)
      pc = reader.page_count
      page = reader.page(pc)
      data = page.text
      totalcomments = getTotalNumberOfComments(data)
      datalist = getMarkupList(data)

      return datalist, totalcomments
    else
      puts "File does not exists"
    end

  end
end