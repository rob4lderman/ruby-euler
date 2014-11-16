#!/usr/bin/ruby
#
# http://projecteuler.net/problem=41
#
# 
# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
# also prime.
# 
# What is the largest n-digit pandigital prime that exists?
# 
# Notes: 
# must be < 987654321
# 1 + 2 + 3 + 4 = 10, possible.
# 1 + 2 + 3 + 4 + 5 = 15 which is divisible by 3, so can't be a prime.
# 1 + 2 + 3 + 4 + 5 + 6 = 21 which is divisible by 3, so can't be a prime.
# 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28, possible.
# 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 = 36, which is divisibe by 3, so can't be a prime
# 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 = 45, which is divisibe by 3, so can't be a prime
#
# so... compute all primes up to 987654321, then check which one is the highest?  takes too long.
#
# how about, compute all pandigital numbers? check which is the highest prime? takes too long.

require "Euler" 

primes = PrimeSet.new

primes.doUntil(5000) { |p| puts "prime: #{p}" }


pe = PrimeSet.new.each

puts "pe.next: #{pe.next}"
puts "pe.next: #{pe.next}"
puts "pe.next: #{pe.next}"

# 7-digit primes:
# (1234567..2000000).each { |n| p n if (PrimeSet.isPrime(n)) }


# count = 0
# 7654321.downto(1234567).each { |n| count += 1 if NumberUtils.isPandigital(n) }
# puts " count: #{count}"

all_primes = Array.new
PrimeSet.new.each { |p| break if p > 1000000; all_primes << p }
 
p all_primes
# 
# largest_pan = all_primes.reverse.find { |p| NumberUtils.isPandigital(p) }
# 
# puts "largest_pan: #{largest_pan}"



