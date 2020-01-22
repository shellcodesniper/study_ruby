# 모듈

>   모듈이란 메소드나 클래스 ,상수(변하지 않는 값)들을 묶는 방법으로서, 특정한 기능을 수행하는 부품이라 한다.
>
>   모듈은 관련있는 상수와 메소드를 하나로 묶어놓을때 사용하거나 Ruby에서 제공하는 믹스인 기능을 위해서 사용한다.



## 모듈 내 메소드 참조

```ruby
puts(Math.sqrt(25))
```



## 모듈 내 상수 참조

```ruby
puts(Math::PI)
```





## 모듈을 만들어보자!

-   module 이라는 키워드로 시작하여 모듈 이름을 적고 endfh akclsek.

-   ## 모듈의 이름은 반드시 대문자로 시작해야 한다!

```ruby
#data/cafe.rb
module Cafe
	module_function()
  # module_function()은 다른 파일에 모듈을 생성하였을때, 모듈 안에 있는 여러 메소드를 접근 가능하도록 만들어주는 내장 메소드라한다.
	def show_menu(beverage)
		puts "Menu"
		beverage.each {|name, price| puts "#{name}\t#{price}"}
	end
	def show_price(beverage, select)
		beverage.each do |name, price|
			if select == name
				return "#{price}원 입니다"
			end
		end
		return "그런 음료는 판매하지 않습니다"
	end
end
```



## 사용법

```ruby
#main.rb
require './data/cafe'

beverage = {'coke' => 3000, 'juice' => 4000, 'tea' => 6000, 'coffee' => 5000}

Cafe.show_menu(beverage)
select = gets.chomp()
puts Cafe.show_price(beverage, select)
```

