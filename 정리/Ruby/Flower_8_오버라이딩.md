# 오버라이딩



>   부모 클래스로부터 상속 받은 자식 클래스가 상속받은 메소드의 내용을 다르게 재정의하는것



```ruby
class Bird
	def preen
		puts "I'm cleaning my feathers"
	end
	def fly
		puts "I'm flying"
	end
end
class Penguin < Bird
	def fly 
		puts "I believe I can fly"
	end
end

pingu = Penguin.new
pingu.preen
pingu.fly
```



## 일부만 오버라이딩

```ruby
class Bird
	def preen
		puts "I'm cleaning my feathers."
	end
	def fly
		puts "I'm flying"
	end
end
class Angry_Bird < Bird
	def fly 
		super
		puts "Let's crush the castle"
	end
end

red = Angry_Bird.new
red.preen
red.fly
```

