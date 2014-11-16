

require 'minitest/autorun'
require './NumberUtils'


class TestProb3 < Minitest::Unit::TestCase

    def log(m, s)
        puts "#{self.class.name}.#{m}: #{s}"
    end

    def test_primeFactorization

        primeFactors = NumberUtils.primeFactorize(105)
        log(__method__, "primeFactors of #{105} = #{primeFactors}")

        primeFactors = NumberUtils.primeFactorize(600851475143)  # NOTE: takes too long with correct method.
        log(__method__, "the primeFactors of #{600851475143} = #{primeFactors}")

        assert_equal 6857, primeFactors.max

    end

end
    


