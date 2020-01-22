# 세 수를 입력 받은후, 각자리 사용 숫자를 표시해줌

list = Array.new(10,0)
(gets.chomp.to_i * gets.chomp.to_i * gets.chomp.to_i).to_s.split('').each { |x| list[x.to_i] += 1}
list.each { |x| puts x }