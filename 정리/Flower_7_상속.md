# 상속

>   객체간 관계를 구축하는 방법이다.
>
>   상위 객체의 기능들을 하위 객체들이 가질 수 있게 하는 방식 > 코드 재사용이 유용, 불필요한 중복 제거
>
>   상속시에 자손 클래스 < 부모 클래스로 표기한다.
>
>   상속받은 자식 클래스는 부모 클래스의 변수나 메소드를 모두 사용 할 수 있다.



```ruby
class Calculator
    def initialize(num1, num2)
        @Cal_num1 = num1
        @Cal_num2 = num2
    end
    def add()
        return @Cal_num1+@Cal_num2
    end
end

class Cal_Sub < Calculator
	def sub()
		return @Cal_num1-@Cal_num2
	end
end

cal_1 = Cal_Sub.new(10, 20)
puts cal_1.add()
puts cal_1.sub()
```



