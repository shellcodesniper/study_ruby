# 메소드



```ruby
def hello()
	puts "Hello, Ruby!"
end
hello()
```



## 메소드 with return value

```ruby
def hello()
	str = "Hello, Ruby!"
	return str
end
puts (hello())
```



## 메소드 with 가변인자

```ruby
def hello(str,*mvar)
	puts str
	mvar.each do |var|
		puts var
	end
end

hello('a','b','c','d')
```



>   ## 메소드 내에서 return 또한 생략 할 수 있다고 한다.
>
>   ## return 이 명시되어있지 않다면, 메소드 내의 코드에서 가장 마지막 문장의 결과를 리턴값으로 가진다고한다.