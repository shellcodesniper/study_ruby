# 루비는 객체지향 언어이다..

>   객체지향 언어이며 모든 것이 객체로서 표현된다



## 루비에서 클래스 정의하기

>   클래스의 정의는 class라는 키워드와 클래스의 이름으로 시작하여 키워드 end로 끝을 구분한다.

```ruby
class Box
	#something
end
```

>   ## 클래스의 이름은 대문자로 시작해야 하며, 카멜 표기법을 사용한다.



## 루비에서 객체 정의하기

>   객체란 데이터와 메소드들의 묶음입니다. 클래스는 이러한 묶음의 구성에 대한 청사진을 제공하므로, 기본적으로 객체는 클래스로부터 만들어진다
>
>   문자열이나 숫자도 객체라고 할수 있다
>
>   클래스에 의해 생성된 객체 = 인스턴스
>
>   인스턴스를 new() 라는 키워드를 사용하여 선언한다.

```ruby
=begin
위에서 만든 Box 클래스를 인스턴스화
=end

box1 = Box.new
box2 = Box.new
```





## 클래스 constructor

```ruby
class Box
	@@num_of_box = 0
	def initialize(name, color, size)
		@box_name = name
		@box_color = color
		@box_size = size
	end
end
```

>   인스턴스 변수 : @~~~~ @@~~~~~

### 실행

```ruby
box1 = Box.new("Toy", "Brown", "Small")
box2 = Box.new("Clothes", "White", "Large")
```



## 클래스 메소드



```ruby
class Calculator
	def initialize(num1, num2)
		puts num1, num2
	end
	def add()
		return num1+num2
	end
end

cal_1 = Calculator.new(10, 20)
puts cal_1.add()
```



## 클래스 인스턴스 변수

>   전달받은 값을 다른 메소드에서도 사용하기 위해서 인스턴스 변수를 생성해야한다.
>
>   인스턴스 변수 : 인스턴수에 포함된 모든 메소드 안에서 사용할 수 있는 변수 (전역변수 ?)
>
>   인스턴스 변수는 @변수명 으로 표기한다.

```ruby
class Calculator
	def initialize(num1, num2)
		puts num1, num2
		@Cal_num1 = num1
		@Cal_num2 = num2
	end
	def add()
		return @Cal_num1+@Cal_num2
	end
end

cal_1 = Calculator.new(10, 20)
puts cal_1.add()
```

>   @Cal_num1, @Cal_num2 는 인스턴스 변수이기 때문에 initialize() 메소드 뿐만 아니라 같은 클래스에 있는 add() 라는 메소드에서 사용 가능