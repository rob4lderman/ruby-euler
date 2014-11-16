



#
# http://en.wikipedia.org/wiki/Primality_test
#
def isPrime(x)
    if (x % 2 == 0)
        return false
    end

    # only need to test up to the sqrt of the number.
    max = Math.sqrt(x).ceil
    i = 3
    
    # check each odd number up to max
    while (i <= max)
        if (x % i == 0)
            return false
        end
        i += 2
    end
    return true
end



def primeFactorization(x)

    # first get the list of possible primes that could factor x
    ## WRONG! ##  primes = (2..Math.sqrt(x).ceil).select { |y| isPrime(y) }

    # This is the more accurate way to do it. Note max is x/3, since the max prime factor would
    # have to be multiplied by at least 3 to get x (can't be 2 obviously)
    puts "determine possible primes..."
    primes = (2..x/3).select { |y| isPrime(y) }  # but this takes too long.
    # puts "possible prime factors: #{primes}"

    # now run thru the list and determine which primes evenly factor into x
    # TODO: there's a more efficient way to do this (see wiki article).  Once
    # the lowest prime factor is determined, you can then prime-factorize the
    # other factor (i.e <lowest-prime-factor> * <other-factor> = x), which should
    # be easier than prime-factorizing x, since <other-factor> < x, so there are
    # fewer primes to check.
    puts "select prime factors..."
    return primes.select { |y| x % y == 0 }
end


# (2..105).each do |x|
#     puts "isPrime(#{x}) = #{isPrime(x)}"
# end


#
# NOTE: even though i got the answer right, this is not the correct algorithm for 
# determining the largest prime factor.  This is because some primes greater than
# the sqrt of X could also factor X, however I'm not considering them.  
#
# NOTE: See prob12.rb for proper Prime factorization
#
primeFactors = primeFactorization(105)
puts "primeFactors of #{105} = #{primeFactors}"
primeFactors = primeFactorization(600851475143)  # NOTE: takes too long with correct method.
puts "primeFactors of #{600851475143} = #{primeFactors}"

puts "primeFactors of #{21} = #{primeFactorization(21)}"
puts "primeFactors of #{28} = #{primeFactorization(28)}"


