require 'rails_helper'

feature "Contact Creation" do
  scenario "allow access to contact page" do
    visit '/contacts'

    # Проверка текста на странице через переводы
    expect(page).to have_content I18n.t('contacts.contact_us')

  end
end