# 믹스인

>   다중 상속 대신 사용하는 방식, 상속을 사용하지 않으면서 특정한 코드만 포함시킬 때 사용한다.
>
>   다중 상속 : 둘 이상의 부모를 가지는것.
>
>   다중상속을 지원하지 않지만 믹스인이라는 기능을 사용가능

-   모듈을 사용하여 클래스에 기능을 추가할 수 있게 한다.
-   클래스에 모듈을 믹스인 할 때는 **include** 라는 메소드를 사용한다.

```ruby
module Func_A
	def color
		puts "switch colors"
	end
end
module Func_B
	def flicker
		puts "flicker light"
	end
end
class Lamp
	include Func_A, Func_B
	def light
		puts "turn on the light"
	end
end

my_lamp = Lamp.new()
my_lamp.light
my_lamp.color
my_lamp.flicker
```

