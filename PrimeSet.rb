

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




