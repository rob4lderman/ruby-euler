#!/usr/bin/ruby
#
# http://projecteuler.net/problem=22
#
# 
# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
# containing over five-thousand first names, begin by sorting it into
# alphabetical order. Then working out the alphabetical value for
# each name, multiply this value by its alphabetical position in
# the list to obtain a name score.
# 
# For example, when the list is sorted into alphabetical order, COLIN, which is
# worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the
# list. So, COLIN would obtain a score of 938 × 53 = 49714.
# 
# What is the total of all the name scores in the file?
# 



# names = IO.readlines("names.txt").map { |line| line.chomp.delete("\"") }

aFile = File.new("names.txt")
names = Array.new
names[0] = ""
aFile.each_line(",") { |line| names << line.chomp(",").delete("\"") }

names = names.sort.collect.with_index do |name,i| 
    i * name.split(//).inject(0) { |sum,c| sum += c.ord - ?A.ord + 1 }
end

p names
p names[938]

namessum = names.inject(0) { |sum,x| sum += x }

puts "namessum: #{namessum}"


# namesum = names[938].split(//).inject(0) { |sum,c| sum += c.ord - ?A.ord + 1 }
# puts "namesum: #{namesum}"


# puts "names: #{names.length} #{names[0]} #{names}"

a = [ "hello", "goodbye" ]
puts "a: #{a.length} #{a[0]} #{a}"


a.collect.with_index { |x,i| puts "x=#{x}, i=#{i}" }




