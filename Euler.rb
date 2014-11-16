

#
#
# Methods for calculating, caching, and iterating thru prime numbers.
#
# Note: not thread safe.
#
#
class PrimeSet

    @@primes = [2, 3, 5, 7, 11, 13, 17, 19]


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
            #brute force, check all subsequent numbers of the form 6k +- 1
            k = (x + 7) / 6  # x could be of the form 6k-1, so move ahead 7 to guarantee we don't retry x
        
            while true
                a = 6*k - 1
                return a if isPrime(a)
                a = 6*k + 1
                return a if isPrime(a)
                k += 1
            end
        end
    end


    #
    # http://en.wikipedia.org/wiki/Primality_test
    #
    def PrimeSet.isPrime(x)
        if (x < 2)
            return false
        elsif (x == 2)
            return true
        end
    
        # only need to check ints up to the sqrt of the number.
        max = Math.sqrt(x).ceil

        # first check all the primes we know about.
        # Note: the first prime we divide with is 2, which is equivalent to a quick isEven check
        @@primes.each do |p| 
            return true if (x == p)
            return false if (x % p == 0) 
        end

        # If the last prime we know about is still less than max,
        # then check all odd numbers until we get to max
        # There's a more efficient way to do this. All primes
        # are of the form 6k +- 1 (except 2,3), so instead of checking all odds
        # we need only check all numbers 6k +- 1, k=1..n, where 6k + 1 <= max.
        # This saves us a single odd number check (worth it?)
        if (@@primes.last < max)
            starting_k = @@primes.last / 6
            ending_k = max / 6
            (starting_k..ending_k).each { |k| return false if ( (x % (6*k-1) == 0) || (x % (6*k+1) == 0) ) }
            # (@@primes.last..max).step(2) { |n| return false if (x % n == 0) }
        end

        return true
    end


    def to_s
        puts "PrimeSet:@@primes:#{@@primes}"
    end

    # -rx- #
    # -rx- # @return the next permutation, or nil if none remain
    # -rx- #
    # -rx- def next
    # -rx-     k = find_k
    # -rx-     return nil if (k < 0)
    # -rx-     l = find_l(k)
    # -rx-     @digits.swap!(k,l)
    # -rx-     @digits.reverse_part!(k+1,@digits.length-1)
    # -rx-     return @digits
    # -rx- end


    #
    # Yields each successive prime to the given block.  If no block
    # is given, returns a lazy Enumerator.
    #
    # Usage: primeEnum = PrimeSet.new.each
    #        primeEnum.next
    #        primeEnum.next
    #
    def each

        if block_given?
            loop do 
                yield nextPrime
            end
        else
            #
            # TODO: i don't really understand how this works...
            Enumerator.new do |yielder|
                loop do
                    yielder.yield nextPrime
                end
            end
        end
    end


    private :nextPrime
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


    #
    # @return all divisors of x
    #
    def NumberUtils.divisorsOf(x)
        return [] if (x == 0)

        divisors = [1,x]

        max = Math.sqrt(x).floor

        (2..max).each do |i|
            if (x % i == 0)
                divisors << i
                divisors << x/i if (i != x/i)  # don't add square root twice
            end
        end

        return divisors
    end


    #
    # @return divisorsOf x, with x excluded.
    #
    def NumberUtils.properDivisorsOf(x)
        a = divisorsOf(x)
        a.delete(x)
        return a
    end


    def NumberUtils.sumProperDivisorsOf(x)
        return properDivisorsOf(x).inject(0) { |m,d| m+=d }
    end


    #
    # Compute the total number of unique, unordered permutations of
    # choosing y elements from a set of x.
    #
    # xCy = x! / (x-y)! y!
    #
    def NumberUtils.binomialCoefficient(x,y)
        return NumberUtils.binomialCoefficientHelper(x,y,x-y)
    end

    def NumberUtils.binomialCoefficientHelper(x,y,z)
        if (x == 1 && y == 1 && z == 1)
            return 1
        else
            c = x.to_f / z.to_f / y.to_f
            x -= 1 unless x == 1
            y -= 1 unless y == 1
            z -= 1 unless z == 1
            return c * NumberUtils.binomialCoefficientHelper(x,y,z)
        end
    end


    #
    # TODO: create lookup table to improve perf.
    # @return x!
    #
    def NumberUtils.factorial(x)
        if (x<=1)
            return 1
        else
            return x * NumberUtils.factorial(x-1)
        end
    end

    #
    # @return true if the x is a palindrome (e.g 35753)
    #
    def NumberUtils.isPalindrome(x)
        return NumberUtils.isPalindromeString(x.to_s)
    end

    def NumberUtils.isPalindromeString(x_str)
        i = 0
        j = x_str.length - 1
        while (i < j)
            if (x_str[i] != x_str[j])
                return false
            else
                i += 1
                j -= 1
            end
        end
        return true
    end

    #
    # @return true if the given number is a 1-n pandigital
    #
    def NumberUtils.isPandigital(x)
        x = x.to_s if x.is_a? Integer
        return ( x.split(//).sort.inject(1) { |m,d| break(0) if m != d.to_i; m += 1 } != 0 ) ? true : false
    end

end




