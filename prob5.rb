#!/usr/bin/ruby
#



def isDivisibleByAll(n, all)
    all_i = all/2
    while all_i <= all
        return false if ( n % all_i != 0 )
        all_i = all_i+1
    end
    return true;
end


def smallestMultOfAll(all)
    n = all * (all-1) # smallest possible

    while true
        return n if isDivisibleByAll(n,all)
        n = n+1
    end
end


puts "smallest of 10: #{ smallestMultOfAll(10) }"
puts "smallest of 20: #{ smallestMultOfAll(20) }"
        


