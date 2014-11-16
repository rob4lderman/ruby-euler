#!/usr/bin/ruby
#
# http://projecteuler.net/problem=28
#
# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
# 
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
# 
# It can be verified that the sum of the numbers on the diagonals is 101.
# 
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
# 
# All the numbers in the up-right diagonal (from 1) are 1..1001 (step 2) x*x 
# All the numbers in the down-left diagonal (from 1) are 2..1000 (step 2) x*x + 1
# All the numbers in the up-left diagonal (from 1) are 3..1001 (step 2) x*x - (x-1)
# All the numbers in the right-down diagonal (from 1) are 2..1000 (step 2) x*x + 1 - x
#
# start at 5*5 = 25
# 4.times
#
#

class NumberUtils

    # All the numbers in the up-right diagonal (from 1) are 1..1001 (step 2) x*x 
    # All the numbers in the down-left diagonal (from 1) are 2..1000 (step 2) x*x + 1
    # All the numbers in the up-left diagonal (from 1) are 3..1001 (step 2) x*x - (x-1)
    # All the numbers in the right-down diagonal (from 1) are 2..1000 (step 2) x*x + 1 - x
    #
    # Assumes x is odd
    #
    def NumberUtils.sumDiagonalsOfClockwiseSpiral(x)
        # sumUpRight includes 1.
        sumUpRight = (1..x).step(2).inject(0) { |sum,y| sum += y*y }
        sumDownLeft = (2..x-1).step(2).inject(0) { |sum,y| sum += y*y + 1 }

        # start at 3 so as not to include 1 again.
        sumUpLeft = (3..x).step(2).inject(0) { |sum,y| sum += y*y - (y-1) }
        sumDownRight = (2..x-1).step(2).inject(0) { |sum,y| sum += y*y + 1 - y }

        sumUpRight + sumDownLeft + sumUpLeft + sumDownRight
    end
end



puts "5x5: #{NumberUtils.sumDiagonalsOfClockwiseSpiral(5)}"
puts "3x3: #{NumberUtils.sumDiagonalsOfClockwiseSpiral(3)}"
puts "7x7: #{NumberUtils.sumDiagonalsOfClockwiseSpiral(7)}"
puts "1001x1001: #{NumberUtils.sumDiagonalsOfClockwiseSpiral(1001)}"
