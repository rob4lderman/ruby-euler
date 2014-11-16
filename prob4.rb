#!/usr/bin/ruby



def isPalindrome(x)
    x_str = x.to_s
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
#
#
def largest3ProdPalindrome
    puts "in largest3ProdPalindrome"
    palin = 0
    p1 = 0
    p2 = 0
    
    999.downto(100) { |i|
        # if a palindrome has been found and i*i is less than it, then don't bother checking
        # any further.
        if (i*i < palin)
            return [palin,p1,p2]
        end

        # start at i.  don't need to check anything above i since we've already computed it
        # in the previous iteration of i
        i.downto(100) { |j|
            x = i * j
            # puts "x=#{x}"
            if (isPalindrome(x) && x > palin)
                palin = x
                p1 = i
                p2 = j
            end
        }
    }
    return 0
end



y = isPalindrome(1001)
puts "isPalindrome(1001): #{y}"
y = isPalindrome(1002)
puts "isPalindrome(1002): #{y}"

palins = (1..1000).select { |n| isPalindrome(n) }
puts "palins: #{palins}"

puts "largest palindrome made of 2 3-digit numbers: #{ largest3ProdPalindrome }"


