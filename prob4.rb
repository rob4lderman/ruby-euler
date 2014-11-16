#!/usr/bin/ruby


require 'minitest/autorun'

class TestProb4 < Minitest::Unit::TestCase

    def log(m, s)
        puts "#{self.class.name}.#{m}: #{s}"
    end

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


    def test_largest3ProdPalindrome

        assert_equal true, isPalindrome(1001)
        assert_equal false, isPalindrome(1002)
        
        palins = (1..1000).select { |n| isPalindrome(n) }

        log(__method__, "palins: #{palins}")
        
        ans = largest3ProdPalindrome 
        log(__method__, "largest palindrome made of the product of two 3-digit numbers: #{ ans }")
        assert_equal 906609, ans.max
    end

end

