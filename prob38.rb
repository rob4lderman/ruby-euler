#! /usr/bin/ruby
#
# http://projecteuler.net/problem=38
# 
# Take the number 192 and multiply it by each of 1, 2, and 3:
# 
#     192 × 1 = 192
#     192 × 2 = 384
#     192 × 3 = 576
# 
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We
# will call 192384576 the concatenated product of 192 and (1,2,3)
# 
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4,
# and 5, giving the pandigital, 918273645, which is the concatenated product of
# 9 and (1,2,3,4,5).
# 
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as
# the concatenated product of an integer with (1,2, ... , n) where n > 1?
# 
# Notes:
#
# must be larger than 918273645
#
# must be smaller than 987654321
# 
# the integer must be pandigital itself (since it will be multiplied by 1)
# the integer must be < 987654321 (since only n=1 would work, but n must be > 1)
# furthermore, the integer must be < 10000, 10000 * 1 is a 5-digit number, 10000 * 2 is a 5 digit number, which would be 10 digits total (too many!)
# the integer must be > 91 (91 itself doesn't work)
# n < 5, since it was already demonstrated that the integer 9 works with n=5, making it the largest integer that would work with n=5

require "Euler"

puts " isPandigital(12345): #{NumberUtils.isPandigital(12345)}"
puts " isPandigital(54321): #{NumberUtils.isPandigital(54321)}"
puts " isPandigital(11345): #{NumberUtils.isPandigital(11345)}"
puts " isPandigital(345): #{NumberUtils.isPandigital(345)}"

puts " concat: #{ (345.to_s + 567.to_s).to_i - 1} "
puts " concat: #{ [345,567].inject("") { |c,d| c += d.to_s }.to_i }"

i = 9
num = (1..5).inject("") { |m,n| m += (9*n).to_s; break(m) if (m.to_i > 100000000); m }.to_i
p num

(92..9876).each do |i|
    # concat i * n to the string, m (the fold memo)
    num = (1..5).inject("") { |m,n| m += (i*n).to_s; break(m) if (m.to_i > 100000000); m }
    puts "i:#{i}, num=#{num}" if NumberUtils.isPandigital(num)
end
    



