# 해시

>   해시 = 파이썬의 튜플같은거

```ruby
grades = {"Soohorang" => 9, "Bandabi"=> 7}
puts grades["Soohorang"]
puts grades["Bandabi"]
```



## 반복자 ?

>   iterator : 배열에서 사용할 수 있는 메소드의 일종이라 한다.
>
>   반복문보다 반복자를 실제로 더 많이 사용한다!



### each 반복자

```ruby
arr = [1, 2, 3, 4, 5]
arr.each {|a| puts a}
# 혹은 아래처럼

arr.each do |a|
  	puts a
end
```



### collect 반복자

>   배열1의 원소를 이용하여 배열2를 새로 만들수 있음

```ruby
a = [1, 2, 3, 4, 5]
b = a.collect{|x| x*10}
puts b
```



## 해시에서 반복자 사용



```ruby
grades = {"Soohorang" => 9, "Bandabi"=> 7}
grades.each{|k, v| puts "Key: #{k}, Value: #{v}"}
```



>   #{변수명} 은 문자열 내에서 변수를 출력할 때 사용한다.