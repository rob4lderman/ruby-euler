#!/usr/bin/ruby
#
# http://projecteuler.net/problem=23
#
# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of 28
# would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
# 
# A number n is called deficient if the sum of its proper divisors is less than n
# and it is called abundant if this sum exceeds n.
# 
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers greater than 28123 can
# be written as the sum of two abundant numbers. However, this upper limit cannot
# be reduced any further by analysis even though it is known that the greatest
# number that cannot be expressed as the sum of two abundant numbers is less than
# this limit.
# 
# Find the sum of all the positive integers which cannot be written as the sum of
# two abundant numbers.
# 
# note: smallest odd abundant number is 945
# note: Every integer greater than 20161 can be written as the sum of two abundant numbers

require "Euler"

$abundantNumbers = (1..28123).select { |x| x < NumberUtils.sumProperDivisorsOf(x) }
$isAbundantArray = Array.new(28124,false)
$abundantNumbers.each { |x| $isAbundantArray[x] = true }


#
# @return nil if not sum of abundants; otherwise [x,a1,a2], where a1,a2 are the abundants
#         that sum to x.
#
def isSumOfAbundants(x)
    max = x/2
    $abundantNumbers.each do |a|
        return nil if a > max
        return [x,a,x-a] if $isAbundantArray[ x - a ]
    end
    return nil 
end

    

puts "isAbundantArray[12] = #{$isAbundantArray[12]}"
puts "isAbundantArray[13] = #{$isAbundantArray[13]}"
puts "isAbundantArray[24] = #{$isAbundantArray[24]}"
puts "isAbundantArray[945] = #{$isAbundantArray[943]}"

# oddAbundants = abundantNumbers.select { |x| !x.even? }
# 
# p oddAbundants
# 
# p NumberUtils.divisorsOf(315)

sumOfAbundantsArray = Array.new()
nonSumOfAbundantsArray = Array.new()
(1..28123).each do |x|
    soa = isSumOfAbundants(x)
    sumOfAbundantsArray.push(soa) if (soa != nil)
    nonSumOfAbundantsArray.push(x) if (soa == nil)
end

# p sumOfAbundantsArray
p nonSumOfAbundantsArray

totalSum = nonSumOfAbundantsArray.inject(0) { |sum,x| sum += x }

puts "totalSum: #{totalSum}"

