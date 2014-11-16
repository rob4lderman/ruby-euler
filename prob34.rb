#!/usr/bin/ruby
#
# http://projecteuler.net/problem=34
#
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# 
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# 
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.
#
#
# Brute force method.
# The question is, what's the upper limit?  What's the maximum value?
# 9 is the largest digit. Assuming 9 in every position, you discover that
# 9! * 7 (digits) = 2540160 (7-digit number)
# 9! * 8 (digits) = 2903040 (7-digit number)
#
# So the MAXIMUM value of the sum of factorials for a 7-digit number, 9999999 = 2540160, which
# is also a 7-digit number.  9! * 8 is also a 7-digit number, so it's impossible to have an
# 8-digit number that sums to an 8-digit number.  Similarly it's impossible to have a 7 digit number
# that sums to a 7-digit number greater than 2540160. So that's the upper limit.

require "Euler"



factorials = Array.new(10)
(0..9).each { |x| factorials[x] = NumberUtils.factorial(x) }

# puts "#{x}! = #{NumberUtils.factorial(x)}"
puts "#{factorials}"

(10..factorials[9] * 7).each do |x|
    sumDF = x.to_s.split(//).inject(0) { |sum,d| break if sum > x; sum += factorials[d.to_i] }
    puts "#{x}, sumDF: #{sumDF}" if x == sumDF
end
    

