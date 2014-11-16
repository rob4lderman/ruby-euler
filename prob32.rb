#!/usr/bin/ruby
#
# http://projecteuler.net/problem=32
#
# 
# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
# through 5 pandigital.
# 
# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.
# 
# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
# 
# Notes:
#  99 * 99 = 9801, which is only 8 digits, so we must be dealing with at least 1 3+ digit multiplicand
#  multiplicands must be < 5 digits, since a 5 digit number * any number >= 5 digit number, total of 11 digits -- too many digits!
#  100 * 100 = 10000, which is 11 digits -- too many! so we're deling with 1 3+ digit number and 1 < 3 digit number
#  1000 * 10 = 10000, which is 11 digits -- too many! so if we're dealing with a 4+ digit multiplicand, the other multiplicand must be only 1 digit.
#
#  In other words, the two multiplicands must contain a total of 5 digits.
#
#
#
#


require "Euler"

puts " concat: #{ (345.to_s + 567.to_s).to_i - 1} "

def isPandigital(x)
    x = x.to_s if x.is_a? Integer
    x = x.split(//)
    return !x.include?(?0) && x == x.uniq
end

puts " isPandigital(12345): #{isPandigital(12345)}"
puts " isPandigital(11345): #{isPandigital(11345)}"
puts " isPandigital(12345): #{isPandigital("12345")}"



def isPandigitalProduct(a,b)
    return NumberUtils.isPandigital( a.to_s + b.to_s + (a*b).to_s )
end

puts " isPandigitalProduct(39,186): #{isPandigitalProduct(39,186)}"
puts " isPandigitalProduct(39,187): #{isPandigitalProduct(39,187)}"


pan_products = Array.new

(123..987).each do |a|
    (12..98).each do |b|
        next if a * b >= 10000
        pan_products << [a,b,(a*b)] if (isPandigitalProduct(a,b))
    end
end

(1234..9876).each do |a|
    (1..9).each do |b|
        next if a * b >= 10000
        pan_products << [a,b,(a*b)] if (isPandigitalProduct(a,b))
    end
end

pan_products.each { |x| p x }

just_products = pan_products.map { |x| x[2] }.uniq
p just_products
puts "sum: #{ just_products.inject(0) { |sum,x| sum += x } }"
