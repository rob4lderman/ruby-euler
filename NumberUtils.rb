
require './PrimeSet'


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
    # @return true if the x is a palindrome (same forwards and backwords, e.g 35753)
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
    # @return true if the given number is a 1..n pandigital (contains all digits 1 thru n)
    #
    def NumberUtils.isPandigital(x)
        x = x.to_s if x.is_a? Integer
        return ( x.split(//).sort.inject(1) { |m,d| break(0) if m != d.to_i; m += 1 } != 0 ) ? true : false
    end

end




