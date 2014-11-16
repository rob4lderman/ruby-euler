#!/usr/bin/ruby
#
# http://projecteuler.net/problem=24
#
# 
# A permutation is an ordered arrangement of objects. For example, 3124 is one
# possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
# are listed numerically or alphabetically, we call it lexicographic order. The
# lexicographic permutations of 0, 1 and 2 are:
# 
# 012   021   102   120   201   210
# 
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
#
# see: http://en.wikipedia.org/wiki/Permutation   for algorithm.
# 
# see project euler forum for analytical evaluation
#
# 0123456789
# 0123456798
#
# 0123456879
# 0123456897
# 0123456978
# 0123456987
#
# 0123459678
# 0123459687
# 0123459768
# 0123459786
# 0123459867
# 0123459876
#
#
# 1234
# 1243
#       -> reverse 43, swap 23
# 1324
# 1342
#       -> reverse 42, swap 34
# 1423
# 1432
#       -> reverse 432, swap 12
# 2134
# 2143
#

require "Euler"


class Array
    def swap!(a,b)
        self[a],self[b] = self[b],self[a]
        self
    end

    def reverse_part!(a,b)
        while (a<b)
            swap!(a,b)
            a += 1
            b -= 1
        end
        self
    end
end

puts "numPerms = #{ NumberUtils.factorial(10) } "

digits = (0..9).to_a

puts "digits: #{digits}"

# puts "digits[9.downto(0)]: #{digits[9.downto(0)]}"
# 8.downto(0).inject(0) { |m,i| puts "m=#{m}, i=#{i}"; ( digits[i] < digits[i+1] ) ? i : m }
# digits.reverse_each.with_index { |x,i| puts "reversed: #{x}, #{i}" }



#
# The following algorithm generates the next permutation lexicographically after a 
# given permutation. It changes the given permutation in-place.
# 
# 1. Find the largest index k such that a[k] < a[k + 1]. If no such index exists, 
#    the permutation is the last permutation.
# 2. Find the largest index l such that a[k] < a[l].
# 3. Swap the value of a[k] with that of a[l].
# 4. Reverse the sequence from a[k + 1] up to and including the final element a[n].
#
# Note: depends on: 
#       Array.swap! 
#       Array.reverse_part!
# 
class Permuter

    attr_reader :digits

    #
    # @param digits an Array of elements to permute
    #
    def initialize(digits)
        @originalDigits = Array.new(digits)
        @digits = Array.new(digits)
    end


    #
    # @return the number of unique permutations for the @digits set.
    #
    def numberOfPermutations
        return NumberUtils.factorial( @digits.length )
    end


    #
    # @return the value of k for the algorithm
    #
    def find_k
        (@digits.length-2).downto(0).each do |i|
            return i if ( @digits[i] < @digits[i+1] )
        end
        return -1
    end


    #
    #
    # @return the value of l, given k, for the algorithm
    #
    def find_l(k)
        (@digits.length-1).downto(0).each do |i|
            return i if ( @digits[k] < @digits[i] )
        end
        return -1
    end


    #
    # @return the next permutation, or nil if none remain
    #
    def next
        k = find_k
        return nil if (k < 0)
        l = find_l(k)
        @digits.swap!(k,l)
        @digits.reverse_part!(k+1,@digits.length-1)
        return @digits
    end


    #
    # Yields each successive permutation to the given block.  If no block
    # is given, returns a lazy Enumerator.
    #
    def each
        @digits = Array.new(@originalDigits)

        if block_given?
            begin
                yield Array.new(@digits)
                @digits = self.next
            end until @digits == nil
        else
            Enumerator.new do |yielder|
                begin
                    yielder.yield Array.new(@digits)
                    @digits = self.next
                end until @digits == nil
            end
        end
    end


    private :find_k, :find_l
    protected :next


end


permuter = Permuter.new(digits)

# puts "find_k: #{permuter.find_k}"
# puts "find_l: #{permuter.find_l(8)}"
# puts "next: #{permuter.next}"
# puts "next: #{permuter.next}"
# puts "next: #{permuter.next}"
# puts "next: #{permuter.next}"

pe = permuter.each

puts "pe.next: #{pe.next}"
puts "pe.next: #{pe.next}"
puts "pe.next: #{pe.next}"
puts "pe.next: #{pe.next}"
puts "pe.next: #{pe.next}"
puts "pe.next: #{pe.next}"

p "take 5 last", permuter.each.take(5).last
puts "take 5 last again #{ permuter.each.take(5).last.to_s.delete(", ") }"
puts "100th permutation: #{ permuter.each.take(100).last }"
puts "1000th permutation: #{ permuter.each.take(1000).last }"
puts "10000th permutation: #{ permuter.each.take(10000).last }"
# puts "100000th permutation: #{ permuter.each.take(100000).last }"
puts "1000000th permutation: #{ permuter.each.take(1000000).last.to_s.delete(", ") }"

p2 = Permuter.new([0,1,2])
p2.each { |a| puts "p2.each #{p2.digits}" }

puts "and again..."
p2.each { |a| puts "p2.each #{p2.digits}" }

# puts "digits.swap: #{digits.swap!(8,9)}"
# puts "digits: #{digits}"
# 
# 
# puts "digits.reverse_part(8,9): #{digits.reverse_part!(8,9)}"
# puts "digits.reverse_part(5,9): #{digits.reverse_part!(5,9)}"



fib = Enumerator.new do |yielder|
    a = b = 1
    loop do
        yielder.yield a
        a,b = b, a+b
    end
end

p fib.take(11)

p p2.each.take(5).last

# p2.enumerator.each { |a| puts "p2.enum.each: #{a}" }
p2.each.with_index { |a,i| puts "p2.enum.each.with_index: #{i}: #{a}" }


