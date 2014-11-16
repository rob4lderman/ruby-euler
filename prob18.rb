#!/usr/bin/ruby
#
# Find the maximum total from top to bottom of the triangle below:
#
# %s/\(\d\) \(\d\)/\1,\2/g      # add commas
# %s/0\(\d\)/ \1/g              # remove leading zeros
#

$a = [[75],
      [95,64],
      [17,47,82],
      [18,35,87,10],
      [20, 4,82,47,65],
      [19, 1,23,75, 3,34],
      [88, 2,77,73, 7,63,67],
      [99,65, 4,28, 6,16,70,92],
      [41,41,26,56,83,40,80,70,33],
      [41,48,72,33,47,32,37,16,94,29],
      [53,71,44,65,25,43,91,52,97,51,14],
      [70,11,33,28,77,73,17,78,39,68,17,57],
      [91,71,52,38,17,14,91,43,58,50,27,29,48],
      [63,66, 4,68,89,53,67,30,73,16,69,87,40,31],
      [ 4,62,98,27,23, 9,70,98,73,93,38,53,60, 4,23]]


puts $a
 

def maxSumPath

    for i in 1..$a.length-1
        prevrow = $a[i-1]
        row = $a[i]
        for j in 0..row.length-1
            # elements along the edge of the triangle can descend from only one ancestor (j or j-1)
            # all other elements have 2 branches they could have descended from (j and j-1)
            branch1sum = (j == 0) ? 0 : prevrow[j-1]
            branch2sum = (j == row.length-1) ? 0 : prevrow[j]
            row[j] = [row[j] + branch1sum, row[j] + branch2sum ].max
        end
        p row
        puts "max for row #{i}: #{row.max}"
    end

    return $a.last.max

end


puts maxSumPath
