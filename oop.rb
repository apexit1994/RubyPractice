class Box
    @@count=0
    def initialize(w,h)
        @width,@height = w,h
        @@count+=1
    end

    def self.counter
        puts "#@@count"
    end

    def geth
        @height
    end

    def getw
        @width
    end

    private :geth, :getw

    def area
        return geth*getw
    end
end

b   = Box.new(3,4)
b1  = Box.new(4,5)
b2  = Box.new(4,5)

Box.counter()

puts b.area