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

class HeaderMetaData

  attr_accessor :total_comments, :doc_number, :project, :revision_version_title

  def initialize(total_comments, doc_number, project, revision_version_title)
    # local variables shadow the reader methods
    @total_comments = total_comments
    @doc_number = doc_number
    @project = project
    @revision_version_title = revision_version_title
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

  def getHeaderMetaData(markupSummary)

    total_comments = doc_number = project = revision_version_title = ''
    array = markupSummary.split("\s")

    $i = 0;
    $length = array.length
    while (array[$i] != "Total") && (array[$i + 1] != "Comments:") do
        $i+=1
        total_comments = array[$i + 2]
    end

    while (array[$i] != "Document") && (array[$i + 1] != "Number") && (array[$i + 2] != "Projects") do
      $i+=1
      doc_number = array[$i+3]
    end
    
    $i+=4

    while (array[$i] != "Revision") && (array[$i + 1] != "Version") && (array[$i + 2] != "Title") do
      project += array[$i]
      $i+=1
    end

    $i+=3

    while (array[$i] != "ID") && (array[$i + 1] != "Type") && (array[$i + 2] != "Comments") do
      revision_version_title += array[$i]
      $i+=1
    end


    
    return HeaderMetaData.new total_comments, doc_number, project, revision_version_title


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
      # totalcomments = getTotalNumberOfComments(data)
      header_meta_data = getHeaderMetaData(data)
      datalist = getMarkupList(data)

      return datalist, header_meta_data
    else
      puts "File does not exists"
    end

  end
end