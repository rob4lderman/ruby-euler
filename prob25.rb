#!/usr/bin/ruby
#
#
# http://projecteuler.net/problem=25
#
# What is the first term in the Fibonacci sequence to contain 1000 digits?
#
#




fib = Enumerator.new do |yielder|
    a = b = 1
    loop do
        yielder.yield a
        a,b = b, a+b
    end
end

#
# http://www.michaelharrison.ws/weblog/?p=163
# 
# @return A new lazy-evaluation Enumerator
def fib.lazy_select(&block)
    # What is yielder? The object that yields the value (x).
    Enumerator.new do |yielder|
        self.each do |x|
            yielder.yield(x) if block.call(x)
        end
    end
end


p fib.first(5)
p fib.take(5)

p fib.lazy_select { |x| x > 10 }.take(5)
p fib.lazy_select { |x| x > 100 }.take(5)

fib.each.with_index do |x,i| 
    if (x.to_s.length >= 1000)
        puts "#{i+1}: #{x.to_s.length}: #{x}" 
        break 
    end
end
