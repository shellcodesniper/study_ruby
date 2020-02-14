# Rails Low Level 캐쉬



```ruby
<% u =  Rails.cache.fetch("combat_list", expires_in: 10.minutes) do %>
	<% CombatLog.last(20).reverse %>
<% end %>
```

