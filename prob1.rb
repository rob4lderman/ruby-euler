#!/usr/bin/ruby
#


def sum3sAnd5s(x, max=10)
    # puts "x is #{x}, max is #{max}"
    if (x >= max)
        return 0;
    elsif (x % 5 == 0 || x % 3 == 0)
        return x + sum3sAnd5s(x+1,max)
    else
        return sum3sAnd5s(x+1,max)
    end
end


rv = sum3sAnd5s(1)
puts "rv is #{rv}"
rv = sum3sAnd5s(1,1000)
puts "rv is #{rv}"


