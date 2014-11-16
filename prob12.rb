#!/usr/bin/ruby
#



class PrimeSet

    @@primes = [2,3,5,7,11,13,17,19]

    def doUntil(max)

        i = 0
        while (@@primes[i] <= max)

        end

    end



class Primes


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


    #
    # http://en.wikipedia.org/wiki/Primality_test
    #
    def Primes.isPrime(x)
        if (x == 2)
            return true
        elsif (x % 2 == 0)
            return false
        end
    
        primeSet = PrimeSet.new

        # only need to test up to the sqrt of the number.
        primeSet.doUntil(Math.sqrt(x).ceil) { |p|
            if (x % i == 0)
                return false
            end
        }

        return true
    end


    #
    # http://en.wikipedia.org/wiki/Primality_test
    #
    def Primes.isPrime(x)
        if (x == 2)
            return true
        elsif (x % 2 == 0)
            return false
        end
    
        # only need to test up to the sqrt of the number.
        max = Math.sqrt(x).ceil
        i = 3
        
        # check each odd number up to max
        # actually.. i only need to check all the prime numbers up to max.
        while (i <= max)
            if (x % i == 0)
                return false
            end
            i += 2
        end
        return true
    end


    #
    #
    #
    def Primes.computePossiblePrimeFactors(x)
        return (2..Math.sqrt(x).ceil).select { |y| isPrime(y) }
    end


    #
    #
    #
    def Primes.primeFactorization(x)
    
        # first get the list of possible primes that could factor x
        primes = computePossiblePrimeFactors(x)
        # puts "possible prime factors: #{primes}"
    
        # now run thru the list and determine which primes evenly factor into x
        # TODO: there's a more efficient way to do this (see wiki article).  Once
        # the lowest prime factor is determined, you can then prime-factorize the
        # other factor (i.e <lowest-prime-factor> * <other-factor> = x), which should
        # be easier than prime-factorizing x, since <other-factor> < x, so there are
        # fewer primes to check.
        return primes.select { |y| x % y == 0 }
    end


end



puts "Prime factorization: #{ Primes.primeFactorization(21) }"
puts "Prime factorization: #{ Primes.primeFactorization(105) }"
puts "Prime factorization: #{ Primes.primeFactorization(2120) }"



