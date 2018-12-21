class Sample
    @@a = 1

    def initialize(id)
        @b=id
    end

    def fun(name)
        @b=name
        puts @b
    end

end

t=Sample.new(5)

print t.fun("hello")
