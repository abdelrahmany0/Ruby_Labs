puts "Lab 1 running"


class ComplexNumber 
    @@add_opertations = 0
    @@multi_opertations = 0
    attr_accessor :comp
    attr_accessor :real
    attr_accessor :imag
    # attr_accessor :opertations
    def initialize(r,i)
        @comp = Complex(r,i)
        @real = r
        @imag = i
    end

    def +(obj)
        @@add_opertations+=1
        return ComplexNumber.new(self.real + obj.real, self.imag + obj.imag)
    end

    def *(obj)
        @@multi_opertations+=1
        return ComplexNumber.new(self.real * obj.real, self.imag * obj.imag)
    end

    def bulk_add(arr)
        @@add_opertations+=1
        return arr.map(&:comp).sum
    end

    def bulk_mlultiply(arr)
        @@multi_opertations+=1
        return arr.map(&:comp).inject(:*)
    end

    def get_stats()
        puts "add operations: " + @@add_opertations.to_s
        puts "multiply operations: " + @@multi_opertations.to_s
    end
end



c1 = ComplexNumber.new(1, 2)
c2 = ComplexNumber.new(1, -2)

puts("ADDITION")
c3 = c1 + c2
puts c3.comp

puts("MULTIPLICATION")
c4 = c1 * c2
puts c4.comp

multi = [c1, c2]

puts "bulk add"
puts c1.bulk_add(multi)

puts "bulk mlultiply"
puts c1.bulk_mlultiply(multi)

c1.get_stats()

puts "end"