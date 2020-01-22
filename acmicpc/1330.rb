# print > < == from two input
a,b = gets.chomp.split(' ')
a = a.to_i
b = b.to_i
if(a > b)
	puts '>'
elsif (a < b)
	puts '<'
else
	puts '=='
end