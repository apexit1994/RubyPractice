class MarkupElement

    attr_accessor :type, :comments, :username, :time
    def initialize( type, comments, username, time)
        # local variables shadow the reader methods
        @type = type
        @comments = comments
        @username = username
        @time = time
      end

end

a =[]
a.push(MarkupElement.new 1,2,4,5)
a.push(MarkupElement.new 1,3,5,1)
a.push(MarkupElement.new 1,4,15,15)

puts a.length