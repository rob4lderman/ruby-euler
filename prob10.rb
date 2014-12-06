#!/usr/bin/ruby
#


require 'minitest/autorun'

class TestProb10 < Minitest::Unit::TestCase

    #
    # http://en.wikipedia.org/wiki/Primality_test
    #
    def isPrime(x)
        if (x % 2 == 0)
            return false
        end
    
        max = Math.sqrt(x).ceil
        i = 3
        
        while (i <= max)
            if (x % i == 0)
                return false
            end
            i += 2
        end
        return true
    end
    
    
    #
    # given prime number x, compute next prime
    #
    def nextPrime(x)
        if (x <= 2)
            return x+1
        else
            #brute force, check all subsequent odds
            nxt = x + 2
            while true
                return nxt if isPrime(nxt)
                nxt += 2
            end
        end
    end
    
    
    def sumPrimesBelow(x=10)
        sum=0
        p = 2
        while (p < x)
            sum += p
            p = nextPrime(p)
        end
        return sum
    end

    def test_sumPrimesBelow2mm

        puts "sum primes below 10: #{sumPrimesBelow(10)}"
        puts "sum primes below 1000: #{sumPrimesBelow(1000)}"
        ans = sumPrimesBelow(2*1000*1000)
        puts "sum primes below 2*1000*1000: #{ans}"
        
        assert_equal 142913828922, ans

    end
end



        

