module LoginHelper
  def login(email, password, action)
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button action
  end

  def register(email, password, password_confirmation, action)
    visit new_user_path
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password_confirmation
    click_button action
  end
end
