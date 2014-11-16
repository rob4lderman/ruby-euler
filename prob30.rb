#!/usr/bin/ruby
#
# http://projecteuler.net/problem=30
#
# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
# 
#     1634 = 14 + 64 + 34 + 44
#     8208 = 84 + 24 + 04 + 84
#     9474 = 94 + 44 + 74 + 44
# 
# As 1 = 1^4 is not a sum it is not included.
# 
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
# 
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
# 
#
# Brute force.
#
# Upper limit? 
# The max digit is 9.  9^5 * 6 (digits) = 354294, which is a 6-digit number, less than 999999.  There can
# be no 6-digit number whose sum of digits^5 is greater than 354294, so this serves as the upper limit.

p 9**5

# to determine upper limit:
# (1..10).each { |x| puts "#{x} * 9^5 = #{x*9**5}" }

fifthPowers = Array.new(10)
(0..9).each { |x| fifthPowers[x] = x**5 }

p fifthPowers

sumOfFifths = Array.new()
(10..6*9**5).each do |x|
    sumD5 = x.to_s.split(//).inject(0) { |sum,d| break if sum > x; sum += fifthPowers[d.to_i] }
    sumOfFifths << x if x == sumD5
    puts "#{x} = #{sumD5}" if x == sumD5
end


puts "sumOfFifths: #{sumOfFifths}, sum: #{ sumOfFifths.inject(0) { |sum,d| sum += d } }"



