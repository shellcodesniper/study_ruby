# EACH iterator 안에서 조건문을 쓰기!

```ruby
if c_1 then e_1 elsif c_2 then e_2 elsif c_3 then e_3 … elsif c_n then e_n else e_nplus1 end
```

>   이런 구성으로

```ruby
lists.each { |x| if c_1 then x = 1 else x = 2 end}
```

>   이런식으로 작성할 수 있다.