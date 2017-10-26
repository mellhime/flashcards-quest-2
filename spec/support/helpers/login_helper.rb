module LoginHelper
  def login(email, password, action)
    click_link action
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button action
  end

  def register(email, password, password_confirmation, action)
    visit new_user_path
    fill_in "user_email", with: "user@example.com"
    fill_in "user_password", with: "foobar"
    fill_in "user_password_confirmation", with: "foobar"
    click_button action
  end
end
