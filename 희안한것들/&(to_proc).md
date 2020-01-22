# & ( to_proc 연산자)





```ruby
list = [1,2,3,4,5]
list.each { |x| x.to_s }
```

>   이걸 이렇게 줄여버릴수가 있다!

```ruby
list = [1,2,3,4,5]
list.each(&:to_s)
```

>   오우 존나좋군?

