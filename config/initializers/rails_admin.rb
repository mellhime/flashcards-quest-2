RailsAdmin.config do |config|
  config.parent_controller = '::ApplicationController'
  config.authorize_with :pundit
  config.authenticate_with do
    # Use sorcery's before filter to auth users
    require_login
  end
  
  config.current_user_method(&:current_user)

  config.model User do
    label "Пользователь" 
    label_plural "Пользователи"
  end

  config.model Card do
    label "Карточка" 
    label_plural "Карточки"
  end

  config.model Block do
    label "Колода" 
    label_plural "Колоды"
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
