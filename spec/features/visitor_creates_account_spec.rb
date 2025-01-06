require "rails_helper"

feature "Account Creation" do

  # Проверка доступности страницы контактов для посетителя
  scenario "allows guest to create account" do
    visit new_user_registration_path
   
    fill_in :user_email, with: "john@example.com"
    fill_in :user_username, with: "JohnDoe"
    fill_in :user_password, with: "password123"
    fill_in :user_password_confirmation, with: "password123"
    click_button "Sign up"

    # Проверка успешного создания аккаунта
    expect(page).to have_content I18n.t("devise.registrations.signed_up") 


  end

end
