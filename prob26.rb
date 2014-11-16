#!/usr/bin/ruby
#
#
# use long division algorithm?
#
# 7 / 1.0000000000000000000000000 -> 0
#     10 -> 1
#      30 -> 4
#       20 -> 2
#        60 -> 8
#         40 -> 5
#          50 -> 7
#           10 -> 1
#



class NumberUtils

    #
    # Use long division to discover the recurring cycle (if any)
    # for the rational number num/den.  Since the result is rational,
    # it will either be a perfect decimal, or it will contain a recurring 
    # portion.
    #
    def NumberUtils.longDivision(num,den,prevRemainders)

        if (den == 0) 
            return [0]
        end

        nextDigit = num / den
        remainder = num % den

        if (remainder == 0)
            # a perfect decimal
            return [nextDigit, 0]

        elsif (prevRemainders.include?(remainder))
            # concludes the repeating pattern. the length of the repeating pattern is related 
            # to the position of the dup remainder.
            recurringLength = prevRemainders.length - prevRemainders.index(remainder)
            return [nextDigit, -1 * recurringLength]  
        else
            prevRemainders.push(remainder)
            return [nextDigit].concat( longDivision( remainder * 10, den, prevRemainders ) )
        end
    end
end



puts " 1/7=#{1/7}, 1%7=#{1%7}"

all = (0..1000).map { |x| [x].concat( NumberUtils.longDivision(1,x,[]) ) }
# all.each.with_index { |dec,i| puts "1/#{i} = #{dec}" }
#all.each { |dec| puts "1/#{dec.first} = #{dec }" }

sortedAll = all.sort { |x,y| x.last <=> y.last }
sortedAll.each { |dec| puts "sorted: 1/#{dec.first} = #{dec}" }

# puts " 1/#{x} = #{NumberUtils.longDivision(1,x,[])}" }

