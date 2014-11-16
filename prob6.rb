#!/usr/bin/ruby
#


def squareOfSums(x)
    sum = (x+1) * x / 2
    return sum * sum
end

def sumOfSquares(x)
    if (x == 1)
        return 1
    else
        return x*x + sumOfSquares(x-1)
    end
end

# 1
# 1 + 3
# 1 + 3 + 5 = 3*3 + (3*3 - (3*2 - 1))
# 1 + 3 + 5 + 7
# 
# sum = 0
# next_odd = 1
# while next_odd <= (2x - 1)
#     sum += sum + next_odd
#     next_odd += 2
# end
# 
# 
# 
# ...
# 1 * x
# 3 * (x-1)
# 5 * (x-2)
# ..
# 2x-1 * 1 (x - (x-1) )
#

puts "the diff is: #{ squareOfSums(100) - sumOfSquares(100) }"

