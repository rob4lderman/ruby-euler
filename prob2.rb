#!/usr/bin/ruby
#



def sumEvenFibs(prevX, x, max=20)
    # puts "#{prevX}, #{x}, #{max}"
    if ( x >= max )
        return 0;
    elsif ( x % 2 == 0 )
        return x + sumEvenFibs(x, prevX + x, max)
    else
        return sumEvenFibs(x, prevX + x, max)
    end
end


rv = sumEvenFibs(0,1)
puts "rv=#{rv}"

rv = sumEvenFibs(0,1,4*1000*1000)
puts "rv=#{rv}"



