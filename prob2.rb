#!/usr/bin/ruby
#

require 'minitest/autorun'

class TestProb2 < Minitest::Unit::TestCase

    def log(m, s)
        puts "#{self.class.name}.#{m}: #{s}"
    end


    def sumEvenFibs(prevX, x, max=20)
        # puts "#{prevX}, #{x}, #{max}"
        if ( x >= max )
            return 0;
        elsif ( x % 2 == 0 )
            return x + sumEvenFibs(x, prevX + x, max)
        else
            return sumEvenFibs(x, prevX + x, max)
        end
    end

    def test_sumEvenFibs
        assert_equal 4613732, sumEvenFibs(0,1,4*1000*1000)
        log(__method__, "the sum of all even fibonacci numbers up to 4,000,000 is #{sumEvenFibs(0,1,4*1000*1000)}")
    end

end




