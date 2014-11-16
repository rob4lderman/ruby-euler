#!/usr/bin/ruby
#
# http://projecteuler.net/problem=39
#
# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, 
# there are exactly three solutions for p = 120.
# 
# {20,48,52}, {24,45,51}, {30,40,50}
# 
# For which value of p <= 1000, is the number of solutions maximised?
# 
# a**2 + b**2 = c**2
#
# a + b + c = p
#
# Euclid's formula for generating EVERY possible triple, given arbitrary positive ints
# m, n, and k, where m > n
#
# a = k * (m**2 - n**2), b = k * (2mn), c = k * (m**2 + n**2)
#

Inf = 1.0/0.0

m_limit = Math.sqrt(1000)

trips = Array.new

(2..m_limit).each do |m|
    (1..m-1).each do |n|
        (1..Inf).each do |k|
            a = k * ( m**2 - n**2 )
            b = k * ( 2 * m * n )
            c = k * ( m**2 + n**2 )
            p1 = a+b+c
            break if (p1 > 1000)
            triple = [a,b,c,p1].sort
            trips << triple
        end
    end
end

p_counts = Array.new(1001,0)

trips.uniq.each { |trip| p trip; p_counts[trip[3]] += 1 }

max_count = 0;
p_counts.each.with_index { |count,i| max_count = count if count > max_count; puts "p=#{i}, count=#{count}" if count > 0 }
puts "max_count: #{max_count}"

