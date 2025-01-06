require "rails_helper"

feature "Contact Creation" do

  # Проверка доступности страницы контактов для посетителя
  scenario "allow access to contact page" do
    visit "/contacts"

    # Проверка текста на странице через переводы
    expect(page).to have_content I18n.t("contacts.contact_us")
  end

  # Проверка возможности создания нового контакта посетителем
  scenario "allows a visitor to create a new contact" do
    visit "/contacts"

    # Заполнение формы контакта
    fill_in "contact_email", with: "john@example.com"
    fill_in "contact_message", with: "Hello, this is a test message."
    click_button "Send message"

    # Проверка успешного создания контакта
    expect(page).to have_content "Contacts#create"
  end
end
