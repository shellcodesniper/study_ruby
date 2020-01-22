# print minum maximum from input
gets.chomp
list = gets.chomp.split(" ").map(&:to_i)
min, max = list[0], list[0]
list.each { |i| if max < i then max = i elsif min > i then min = i end}
puts "#{min} #{max}"
