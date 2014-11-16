#!/usr/bin/ruby
#
#



class NumberUtils

    def NumberUtils.collatzSequence(x)
        if (x == 1)
            return [x]
        elsif (x % 2 == 0)
            return [x].concat( collatzSequence( x/2 ) )
        else
            return [x].concat( collatzSequence( 3*x+1 ) )
        end
    end

end


class CollatzSequence

    @@knownSequences = Hash.new

    def CollatzSequence.compute(x)
        if (@@knownSequences[x] != nil)
            # puts "using known sequence for x=#{x}"
            return @@knownSequences[x]
        elsif (x == 1)
            return [x]
        elsif (x.even?)
            return (@@knownSequences[x] = [x].concat( compute( x/2 ) ))
        else
            return (@@knownSequences[x] = [x].concat( compute( 3*x+1 ) ))
        end
    end
end


puts "collatzSequence(13): #{ NumberUtils.collatzSequence(13) } "
puts "compute(13): #{ CollatzSequence.compute(13) } "
puts "compute(26): #{ CollatzSequence.compute(26) } "
puts "compute(50): #{ CollatzSequence.compute(50) } "

#
# Note: this still takes a while (about a minute).  Not sure how else to speed it up.
allChains = (1..1000000).map { |x| CollatzSequence.compute(x) }

# puts "allchains: #{allChains}"

longestChain = allChains.inject([]) { |m,c| (m.length > c.length) ? m : c }
 
puts "longestChain (length=#{longestChain.length}): #{longestChain}"

