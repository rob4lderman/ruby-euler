#!/usr/bin/ruby
#
#
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# 
# What is the sum of the digits of the number 2^1000?
#
#
# Some analytical approximations, and other reference materials:
# http://answers.yahoo.com/question/index?qid=20110906033040AAHAdIP
# http://math.stackexchange.com/questions/184823/summing-digits-of-powers-of-2-to-get-1-2-4-8-7-5-pattern
#
# Euler's theorem
# mod 9 math
#



puts "2^5=#{2**5}"
puts "2^100=#{2**100}"
puts "2^1000=#{2**1000}"


sum = (2**1000).to_s.split(//).inject(0) { |m,d| m += d.to_i }

puts "sum=#{sum}"
