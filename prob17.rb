#!/usr/bin/ruby
#
#
# 
# 
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# 
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
# 
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 
# 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
#
# one
# two
# three
# four
# five
# six
# seven
# eight
# nine
# ten
# eleven
# twelve
# thirteen
# fourteen
# fifteen
# sixteen
# seventeen
# eightteen
# nineteen
# twenty
# twenty-one
# ..
# thirty
# thirty-one
# ..
# forty
# fifty
# sixty
# seventy
# eighty
# ninety
# one hundred 
# one hundred and one

$numwords = %w{
zero
one
two
three
four
five
six
seven
eight
nine
ten
eleven
twelve
thirteen
fourteen
fifteen
sixteen
seventeen
eighteen
nineteen}


$tenwords = %w{
zero
ten
twenty
thirty
forty
fifty
sixty
seventy
eighty
ninety}


def numToWord(x)
    if (x == 0)
        return ""
    elsif ( x < 20 )
        return $numwords[x]
    elsif ( x < 100 )
        return $tenwords[x/10] + ( (x%10 != 0) ? "-" + $numwords[x%10] : "" )
    elsif ( x < 1000 )
        return $numwords[x/100] + " hundred" + ( (x%100 != 0) ? " and " + numToWord(x%100) : "" )
    elsif ( x < 1000000 )
        return numToWord(x/1000) + " thousand " + numToWord(x%1000)
    end
end

puts "8 is #{$numwords[8]}"

puts "18 is #{$numwords[18]}"

puts "28 is #{$tenwords[28/10]}-#{$numwords[28%10]}"

(1..150).each do |x|
    puts numToWord(x).delete("- ")
end

letterCount5 = (1..5).inject(0) { |m,x| m += numToWord(x).delete("- ").length }
puts "letter count 5: #{letterCount5}"

letterCount99 = (1..99).inject(0) { |m,x| m += numToWord(x).delete("- ").length }
puts "letter count 99: #{letterCount99}"

puts "1550 is #{numToWord(1550)}"
puts "550550 is #{numToWord(550550)}"

letterCount1000 = (1..1000).inject(0) { |m,x| m += numToWord(x).delete("- ").length }
puts "letter count 1000: #{letterCount1000}"

letterCount51= (50..52).inject(0) { |m,x| m += numToWord(x).delete("- ").length }
puts "letter count 50-52: #{letterCount51}"

# 854 * 10  # one to ninety-nine  (8540)
# 99 * 3 * 9 # all the "and"s, e.g. one hundred and ten.  two hundred and fifty    (2673)
# + "one hundred" = 10 * 100  (1000)
# 10 * 100 (1000)
# 12 * 100 (1200)
# 11 * 100 (1100)
# 11 * 100 (1100)
# 10 * 100 (1000)
# 12 * 100 (1200)
# 12 * 100 (1200)
# 11 * 100 (1100)
# + "one thousand" = 11

checkIt = 854 * 10 + 
            99 * 3 * 9 + 
            "onehundred".length * 100 + 
            "twohundred".length * 100 + 
            "threehundred".length * 100 + 
            "fourhundred".length * 100 + 
            "fivehundred".length * 100 + 
            "sixhundred".length * 100 + 
            "sevenhundred".length * 100 + 
            "eighthundred".length * 100 + 
            "ninehundred".length * 100 + 
            "onethousand".length

puts "checkIt: #{checkIt}"
