# 배열

```ruby
fruit = ['apple', 'orange', 'mango', 'plum', 'berry']
puts fruit[0]
puts fruit[1]
puts fruit[2]
puts fruit[3]
puts fruit[4]
```



>   배열에는 문자열 뿐 아닌 숫자,  boolean등 다양한 자료형을 담을수 있다고한다.



## new() 메소드를 이용한 배열 생성

```ruby
names = Array.new
```



## 배열의 크기를 미리 지정

```ruby
names = Array.new(20)
puts names.size
puts names.length
```



## 배열의 초기화 값을 미리 지정

```ruby
names = Array.new(5, "Ruby")
```



## 배열 출력방법

```ruby
for index in 0..names.size
  puts names[index]
end

for name in names
	puts name
end

names.each { |name| puts name}
#반복자
```

