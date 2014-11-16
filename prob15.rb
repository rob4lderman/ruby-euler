#!/usr/bin/ruby
#



class NumberUtils

    #
    # Compute the total number of unique, unordered permutations of
    # choosing y elements from a set of x.
    #
    # xCy = x! / (x-y)! y!
    #
    def NumberUtils.binomialCoefficient(x,y)
        return NumberUtils.binomialCoefficientHelper(x,y,x-y)
    end

    def NumberUtils.binomialCoefficientHelper(x,y,z)
        if (x == 1 && y == 1 && z == 1)
            return 1
        else
            c = x.to_f / z.to_f / y.to_f
            x -= 1 unless x == 1
            y -= 1 unless y == 1
            z -= 1 unless z == 1
            return c * NumberUtils.binomialCoefficientHelper(x,y,z)
        end
    end

end



puts "4C2 = #{ NumberUtils.binomialCoefficient(4,2) }"
puts "6C3 = #{ NumberUtils.binomialCoefficient(6,3) }"
puts "40C20 = #{ NumberUtils.binomialCoefficient(40,20) }"

