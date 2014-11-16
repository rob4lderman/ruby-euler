



def factorial(x)
    if (x==1)
        return 1
    else
        return x * factorial(x-1)
    end
end


puts "10! #{factorial(10)}"
puts "100! #{factorial(100)}"


v = factorial(100).to_s.split(//).inject(0) { |sum,d| sum += d.to_i }
puts "v=#{v}"

