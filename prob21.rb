#!/usr/bin/ruby
#
# http://projecteuler.net/problem=21
#
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ? b, then a and b are an amicable pair and each of a and b are called amicable numbers.
# 
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# 
# Evaluate the sum of all the amicable numbers under 10000.
# 


require 'Euler'

    

puts "divisors(220): #{NumberUtils.divisorsOf(220)}"
puts "proper divisors(220): #{NumberUtils.properDivisorsOf(220)}"
puts "sum proper divisors(220): #{NumberUtils.sumProperDivisorsOf(220)}"
puts "proper divisors(496): #{NumberUtils.properDivisorsOf(496)}"
puts "sum proper divisors(496): #{NumberUtils.properDivisorsOf(496).inject(0) { |m,d| m+=d }}"


properDivisorsSums = (0..10000).map { |x| NumberUtils.sumProperDivisorsOf(x) }

p properDivisorsSums

amicables = Array.new
(1..10000).each do |i|  
    pds = properDivisorsSums[i]
    amicables.push( [ i, pds ] ) if ( i != pds && pds < properDivisorsSums.length && i == properDivisorsSums[ pds ] && amicables.find { |a| a == [pds, i] } == nil)
end

p "amicables: #{amicables}"

sumAmicables = amicables.inject(0) { |s,a| s += a[0] + a[1] }

puts "sumAmicables: #{sumAmicables}"



