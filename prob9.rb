#!/usr/bin/ruby
#


require 'minitest/autorun'

class TestProb9 < Minitest::Unit::TestCase

    # 
    # euclid's formula for finding pythagorean triples:
    # a = m2 - n2
    # b = 2mn
    # c = m2 + n2
    #
    # for any m,n, where m>n
    #
    # so, a + b + c = 1000
    #   m2 - n2 + 2mn + m2 + n2 = 1000
    #   2m2 + 2mn = 1000
    #   2 (m2 + mn) = 1000
    #   m2 + mn = 500
    #   m + n = 500/m , m>n
    #
    #   m=10
    #   n=40, or
    #
    #   m=5
    #   
    #   @return the set (m,n), where m+n = 500/m
    #
    def findMN
        (1..Math.sqrt(500).floor).each { |m|
            (1..m).each { |n|
                if (m + n) == 500.0/m
                    return [m,n]
                end
            }
        }
        return [0,0]
    end


    def test_findPythagoreanTriplet

        (m,n) = findMN
        puts "m,n: #{m}, #{n}"
        
        a = m*m -  n*n
        b = 2 * m * n
        c = m*m + n*n
        
        puts "a,b,c: #{[a,b,c]}, a2+b2 = #{a*a+b*b}, c2 = #{c*c} prod: #{a*b*c}"
        
        assert_equal 31875000, a*b*c

    end
end

