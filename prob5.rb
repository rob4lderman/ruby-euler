#!/usr/bin/ruby
#

require 'minitest/autorun'

class TestProb5 < Minitest::Unit::TestCase

    def log(m, s)
        puts "#{self.class.name}.#{m}: #{s}"
    end

    #
    # @return true if n is divisible by all integers 1..all
    #
    def isDivisibleByAll(n, all)
    
        # only need to check all/2 -> all , because if it's divisible
        # by 2*x (in the range all/2 -> all), then it's also divisible by x 
        # (in the range 1 -> all/2).  We're just factoring out the 2.
        all_i = all/2
        while all_i <= all
            return false if ( n % all_i != 0 )
            all_i = all_i+1
        end
        return true;
    end
    
    #
    # @return the smallest number that is a multiple of (i.e is divisibly by)
    #         all the integers from 1..all
    #
    def smallestMultOfAll(all)
        n = all * (all-1) # smallest possible
    
        while true
            return n if isDivisibleByAll(n,all)
            n = n+1
        end
    end


    #
    # TODO: this test takes a while (~60s). I'm sure there's a faster way.
    #
    def test_smallestMultOfAll


        of10 = smallestMultOfAll(10)
        of20 = smallestMultOfAll(20) 
        
        assert_equal 2520, smallestMultOfAll(10)
        assert_equal 232792560, smallestMultOfAll(20) 

        log(__method__, "the smallest multiple of 1..10: #{ of10 }")
        log(__method__, "the smallest of 20: #{ of20 }")

    end
        
end


