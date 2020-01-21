# 코드블록



## times() 와 upto

```ruby
5.times() {|i| puts i}
3.upto(5) {|i| puts i}
```



>   실행결과

```bash
#출력 결과
0	#5.times{} {|i| puts i}의 실행 결과
1
2
3
4
3	#3.upto(5) {|i| puts i}의 실행 결과
4
5
```



## times()

-   숫자.times()는 숫자만큼 같은 동작을 반복하는 메소드이다.



## upto()

-   숫자1.upto(숫자2) 은 숫자1부터 숫자2까지 같은 동작을 반복하는 메소드이다.



## 코드블럭 만들기

```ruby
# 메소드
def my_method
	puts 'start'
	yield
	puts 'end'
end
# 블록
my_method do
	puts "yield"
end
```

1.  my_method 가 호출된다
2.  puts 'start'  가 실행된다
3.  yield 에서 do ~~~ 안에 있는 puts "yield" 가 실행된다.
4.  다시 my_method 안 puts 'end' 가 실행된다.



## yield 에서 값 입력 받기

```ruby
# 메소드
def my_method
	yield("goorm", 6)
end
# 블록
my_method do |name, age|
	puts "#{name} is #{age} years old"
end
```



1.  my_method 안 yield 가 실행되어 goorm, 6 이라는 값이 블록으로 넘어간다.
2.  각각 name, age 에 대입되어
3.  puts "~~~~" 가 실행된다



## 심지어 yield 에서 리턴값을 가져올수도 있단다.

```ruby
# 메소드
def my_method
	value = yield
	puts "value from block : #{value}"
end
# 블록
my_method do
	10
end
```

1.  yield 가 호출된다
2.  블록은 가장 마지막에 계산된 값을 리턴합니다. (10)
3.  그러므로 value < 10 이 들어가고
4.  puts "~~~~" 가 실행된다.