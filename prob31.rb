#!/usr/bin/ruby
#
# Coin sums:
# 
# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
# 
#     1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# 
# It is possible to make £2 in the following way:
# 
#     1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# 
# How many different ways can £2 be made using any number of coins?
# 
#


#
# Step by step count the unique permutations.
#
# The algorithm essential visits each coin and selects from 0 to n of that coin,
# for as long as the total value of the selected coins is less than the target (200),
# and recursively selects all permutations of coins of lesser value in combination
# with the currently selected coin and the current running total.
# 
#
# @param coinValues - in descending order.
#
def countPermutations(coinValues, thisCoinIndex, runningSum, coinCounts)

    remainingSum = 200 - runningSum
    # If we're already at the target, return 1 - i.e. the sum is achieved, the permutation is complete.
    if (remainingSum == 0)
        coinCounts[thisCoinIndex] = 0
        puts " found permutation: #{coinCounts}"
        return 1

    # If we're down to pennies, then there's just one further permutation down this path - toping it off with pennies
    elsif (coinValues[thisCoinIndex] == 1 )

        coinCounts[thisCoinIndex] = remainingSum
        puts " found permutation: #{coinCounts}"
        coinCounts[thisCoinIndex] = 0
        return 1

    # We've still got some room, and there are lesser coins to select.  Recurse thru all the possibilities.
    else
        nThisCoin = 0   # number of times we've picked this coin.
        coinCounts[thisCoinIndex] = nThisCoin

        permutationCount = 0       
        while (nThisCoin * coinValues[thisCoinIndex] <= remainingSum)
            permutationCount += countPermutations(coinValues, thisCoinIndex+1, runningSum + nThisCoin * coinValues[thisCoinIndex], coinCounts)
            nThisCoin += 1
            coinCounts[thisCoinIndex] = nThisCoin
        end

        coinCounts[thisCoinIndex] = 0 # reset.
        return permutationCount
    end

end


coins = [200,100,50,20,10,5,2,1]
coinCounts = [0,0,0,0,0,0,0,0]

puts " permutations: #{ countPermutations(coins,0,0,coinCounts) } "



