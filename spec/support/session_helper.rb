def sign_up
  
  
  visit new_user_registration_path

  # Заполнение формы регистрации и отправка данных на сервер
  fill_in :user_email, with: "john1234@example.com"
  fill_in :user_username, with: "JohnDoe1234"
  fill_in :user_password, with: "password123"
  fill_in :user_password_confirmation, with: "password123"

  # Отправка формы регистрации на сервер для создания нового пользователя
  click_button "Sign up"
end
