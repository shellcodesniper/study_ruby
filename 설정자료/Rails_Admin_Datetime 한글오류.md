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

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.try(:admin?)
  end

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end


```

>   Rails_Admin.md