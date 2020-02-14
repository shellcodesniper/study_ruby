```ruby
# Custom Field

RailsAdmin.config do |config|
	config.model Cron do
		edit do
			include_all_fields
			exclude_fields :created_at
			field :next do
				strftime_format do
					'%Y-%m-%d %H:%M:%S'
				end
			end
		end
		list do
			include_all_fields
			exclude_fields :created_at
			field :next do
				strftime_format do
					'%Y-%m-%d %H:%M:%S'
				end
			end
		end
	end

	config.model CombatLog do
		list do
			field :id do
			end
			field :player do
			end
			field :attacker do
			end
			include_all_fields
			exclude_fields :created_at, :updated_at
		end
	end
```

>   Rails_Admin.rb

위에 보이는것처럼 커스텀 필드를 작성해주면 된다.

