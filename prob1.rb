#!/usr/bin/ruby
#

require 'minitest/autorun'

# ERROR: /usr/lib/ruby/gems/1.9.1/gems/minitest-4.7.5/lib/minitest/unit.rb:19:in `const_missing': uninitialized constant MiniTest::Test (NameError) from prob1.rb:6:in `<main>'
#        https://github.com/seattlerb/minitest/issues/280
#        https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=744081
#
# class TestProb1 < Minitest::Test
class TestProb1 < Minitest::Unit::TestCase

    def log(m, s)
        puts "#{self.class.name}.#{m}: #{s}"
    end

    def setup
        log(__method__, "entry")
    end

    def sum3sAnd5s(x, max=10)
        # log("x is #{x}, max is #{max}")
        if (x >= max)
            return 0;
        elsif (x % 5 == 0 || x % 3 == 0)
            return x + sum3sAnd5s(x+1,max)
        else
            return sum3sAnd5s(x+1,max)
        end
    end

    def test_sum3sAnd5s
        assert_equal 23, sum3sAnd5s(1)
        assert_equal 233168, sum3sAnd5s(1,1000)
        log(__method__,"the sum of all numbers up to 1000 that are divisble by 3 or 5 is #{sum3sAnd5s(1,1000)}")
    end
end


