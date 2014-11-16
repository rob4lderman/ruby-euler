#!/usr/bin/ruby

#
# http://en.wikipedia.org/wiki/Primality_test
#
def isPrime(x)
    if (x % 2 == 0)
        return false
    end

    max = Math.sqrt(x).ceil
    i = 3
    
    while (i <= max)
        if (x % i == 0)
            return false
        end
        i += 2
    end
    return true
end



def findPrimeX(x)
    if (x == 1)
        return 1
    elsif (x == 5001)
        return 48619
    else
        primePrevX = findPrimeX(x-1)
        nextCheck = primePrevX + 2  # smallest next prime is next odd number.
        while true
            return nextCheck if isPrime(nextCheck)
            nextCheck += 2 # check all odds until we get to the next prime
        end
    end
end


puts "prime # 6 is #{findPrimeX(6)}"
puts "prime # 101 is #{findPrimeX(101)}"
puts "prime # 1001 is #{findPrimeX(1001)}"
puts "prime # 5001 is #{findPrimeX(5001)}"   # prime # 5001 is 48619

puts "prime # 10001 is #{findPrimeX(10001)}"


