#!/usr/bin/ruby
#
# Euler discovered the remarkable quadratic formula:
# 
# n² + n + 41
# 
# It turns out that the formula will produce 40 primes for the consecutive values
# n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible
# by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.
# 
# The incredible formula  n² - 79n + 1601 was discovered, which produces 80
# primes for the consecutive values n = 0 to 79. The product of the coefficients,
# -79 and 1601, is -126479.
# 
# Considering quadratics of the form:
# 
#     n² + an + b, where |a| < 1000 and |b| < 1000
# 
#     where |n| is the modulus/absolute value of n
#     e.g. |11| = 11 and |-4| = 4
# 
# Find the product of the coefficients, a and b, for the quadratic expression
# that produces the maximum number of primes for consecutive values of n, starting with n = 0.
#

require "Euler"


def quadratic(n,a,b)
    n*n + a*n + b
end

inf = 1.0 / 0.0
maxPrimes = [1,41,40]  # [a,b,numPrimes]
maxPrimes = [0,0,0]

allMps = []

range = 999
(-1*range..range).each do |a|
    (-1*range..range).each do |b|
        maxN = (0..inf).inject(0) { |m,n| break n unless PrimeSet.isPrime( quadratic(n,a,b) ) }
        mp = [a,b,maxN]
        allMps.push(mp)
        maxPrimes = mp if (mp[2] > maxPrimes[2])
    end
end


puts "sorted:"
p allMps.sort { |x,y| y[2] <=> x[2] }.take(100)

puts "maxPrimes: #{maxPrimes}"






