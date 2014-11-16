#!/usr/bin/ruby
#




#
#
# Methods for calculating, caching, and iterating thru prime numbers.
#
# Note: not thread safe.
#
class PrimeSet

    @@primes = [2, 3, 5, 7, 11, 13, 17, 19]

    private :nextPrime

    def initialize
        @i = 0
    end


    def doUntil(max)
        p = nextPrime
        while (p <= max)
            yield(p)
            p = nextPrime
        end
    end


    #
    # 
    #
    def nextPrime
        if (@i >= @@primes.length)
            @@primes.push( PrimeSet.computeNextPrime( @@primes.last ) )
        end
        @i += 1  # for the next go around
        return @@primes[ @i - 1 ]
    end


    #
    # given prime number x, compute next prime
    #
    def PrimeSet.computeNextPrime(x)
        
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
    def PrimeSet.isPrime(x)
        if (x == 2)
            return true
        end
    
        # only need to check ints up to the sqrt of the number.
        max = Math.sqrt(x).ceil

        # first check all the primes we know about.
        @@primes.each do |p| 
            return true if (x == p)
            return false if (x % p == 0) 
        end

        # If the last prime we know about is still less than max,
        # then check all odd numbers until we get to max
        # TODO: there's a more efficient way to do this. All primes
        # are of the form 2k +- 1, so instead of checking all odds
        # we need only check all numbers 2k +- 1, k=1..n, where 2k + 1 <= max.
        if (@@primes.last < max)
            (@@primes.last..max).step(2) { |n| return false if (x % n == 0) }
        end

        return true
    end


    def to_s
        puts "PrimeSet:@@primes:#{@@primes}"
    end

end



#
# Various mathematic/numerical methods 
#
class NumberUtils

    #
    # @return the set of all prime factors for x.  may contain dups.
    #
    def NumberUtils.primeFactorize(x)
    
        return [x] if PrimeSet.isPrime(x)
    
        ps = PrimeSet.new
    
        max = Math.sqrt(x).ceil
    
        ps.doUntil(max) do |p|
            if ( x % p == 0 )
                return [p].concat( primeFactorize(x/p) )
            end
        end
    
        # shouldn't get here (unless x is 0 or 1)
        return []
    end
    
    
    #
    # @return the xth triangle number (sum of all numbers from 1 to x)
    #
    def NumberUtils.triangleNumber(x)
        return x * (x+1) / 2
    end


    #
    # @return the number of divisors of x
    #
    def NumberUtils.countDivisorsFor(x)

        # compute prime factors
        factors = NumberUtils.primeFactorize(x)

        # hash out the dups.
        dups = factors.inject(Hash.new(0)) { |h,x| h[x] += 1 ; h }

        # total number of factors can be found by multiplying together all
        # the number of dups (http://www.wikihow.com/Determine-the-Number-of-Divisors-of-an-Integer)
        # (actually #dups+1)
        return dups.values.inject(1) { |p,x| p * (x+1) }

    end

end





puts "isPrime(7)=#{PrimeSet.isPrime(7)}"
puts "isPrime(21)=#{PrimeSet.isPrime(21)}"
puts "isPrime(37)=#{PrimeSet.isPrime(37)}"
puts "isPrime(101)=#{PrimeSet.isPrime(101)}"
    

ps = PrimeSet.new
puts "ps: #{ps}"
ps.doUntil(3000) { |p| puts "#{p}" }
puts "ps: #{ps}"


puts "primeFactorize(21): #{NumberUtils.primeFactorize(21)}"
puts "primeFactorize(13195): #{NumberUtils.primeFactorize(13195)}"
puts "primeFactorize(600851475143): #{NumberUtils.primeFactorize(600851475143)}"  
puts "primeFactorize(18): #{NumberUtils.primeFactorize(18)}"  
puts "primeFactorize(120): #{NumberUtils.primeFactorize(120)}"  

puts "triangle numbers from 1 to 10: #{ (1..10).map { |x| NumberUtils.triangleNumber(x) } }"

factors = NumberUtils.primeFactorize(120)
dups = factors.inject(Hash.new(0)) { |h,x| h[x] += 1 ; h }
totalNumberOfFactors = dups.values.inject(1) { |p,x| p * (x+1) }

puts "factors: #{factors}, dups: #{dups}, totalNumberOfFactors: #{totalNumberOfFactors}"


puts "countDivisorsFor(24): #{NumberUtils.countDivisorsFor(24)}"
puts "countDivisorsFor(28): #{NumberUtils.countDivisorsFor(28)}"


#
# Find first triangle number with > 500 factors
#
n = 1
while true

    tn = NumberUtils.triangleNumber(n)
    fn = NumberUtils.countDivisorsFor(tn)

    puts "#{n}, tn:#{tn}, fn:#{fn}"

    break if (fn > 500)

    n += 1

end


