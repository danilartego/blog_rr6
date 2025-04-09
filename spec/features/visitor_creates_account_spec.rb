require "rails_helper"

feature "Account Creation" do
  scenario "allows guest to create account" do
    puts "Before sign_up - User count: #{User.count}"
    sign_up
    puts "After sign_up - User count: #{User.count}"
    puts "Page content: #{page.text}"
    
    expect(page).to have_content I18n.t("devise.registrations.signed_up")
  end
end