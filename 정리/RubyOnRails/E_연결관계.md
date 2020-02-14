```ruby
class ChangeFieldFromCombatLog < ActiveRecord::Migration[5.2]
  def change
	remove_column :combat_logs, :ammo
	remove_column :combat_logs, :area
	remove_column :combat_logs, :old_hp
	remove_column :combat_logs, :new_hp
	remove_column :combat_logs, :time
	remove_column :combat_logs, :target

	add_column :combat_logs, :damage, :float

  end
end

```

Migration 문서 작성후



```ruby
class CombatLog < ApplicationRecord
  belongs_to :player, class_name: "Player"
  belongs_to :attacker, class_name: "Player"
end

```

이렇게 모델에 들어가서 연겱관계를 정의해주면 된다.

```ruby
class CombatLog < ApplicationRecord
  belongs_to :player
end

```

이렇게 해주면 :player > Player 모델로 1:1 연결된다.