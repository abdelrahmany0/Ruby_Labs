puts "Lab 1 running"


class ComplexNumber
    @@operations = {'add_operations'=>0, 'multi_opertations'=>0, 'bulk_add'=>0, 'bulk_multi'=>0} 
    attr_accessor :comp, :real, :imag
    # attr_accessor :opertations
    def initialize(r,i)
        @comp = Complex(r, i)
        @real = r
        @imag = i
    end

    def +(obj)
        @@operations['add_operations']+=1
        ComplexNumber.new(self.real + obj.real, self.imag + obj.imag)
    end

    def *(obj)
        @@operations['multi_opertations']+=1
        ComplexNumber.new(
            (self.real * obj.real) - (self.imag * obj.imag), 
            (self.real * obj.imag) + (self.imag * obj.real)
        )
    end

    def bulk_add(arr)
        @@operations['bulk_add']+=1
        arr.map(&:comp).sum
    end

    def bulk_mlultiply(arr)
        @@operations['bulk_multi']+=1
        arr.map(&:comp).inject(:*)
    end

    def get_stats()
        puts "add operations: " + @@operations['add_operations'].to_s
        puts "multiply operations: " + @@operations['multi_opertations'].to_s
        puts "bulk_add operations: " + @@operations['bulk_add'].to_s
        puts "bulk_multi operations: " + @@operations['bulk_multi'].to_s
    end
end



c1 = ComplexNumber.new(1, 2)
c2 = ComplexNumber.new(1, -2)

puts("ADDITION")
c3 = c1 + c2
puts c3.comp
puts ""

puts("MULTIPLICATION")
c4 = c1 * c2
puts c4.comp
puts ""

multi = [c1, c2]

puts "bulk add"
puts c1.bulk_add(multi)
puts ""

puts "bulk mlultiply"
puts c1.bulk_mlultiply(multi)
puts ""

puts "STATUS"
c1.get_stats()

puts "end"