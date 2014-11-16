#!/usr/bin/ruby
#
# http://projecteuler.net/problem=36
# 
# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# 
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not include leading zeros.)
# 
# 


require "Euler"


puts " palin(343): #{NumberUtils.isPalindrome(343)}"
puts " palin(344): #{NumberUtils.isPalindrome(344)}"

puts " 9 = #{9.to_s(2)}"


palins = (1..999999).step(2).select { |x| NumberUtils.isPalindrome(x) && NumberUtils.isPalindromeString(x.to_s(2)) }
puts "palins: #{palins}"
puts "sum: #{palins.inject(0) { |sum,x| sum += x } }"

