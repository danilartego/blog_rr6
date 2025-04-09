require "rails_helper"

feature "Article Creation" do
  # Пока выдает ошибку
  # before(:all) do
  #   sign_up
  # end

  # Проверка доступности страницы создания статьи для пользователя
  scenario "allows user to visit the new article page" do
    sign_up
    # Переход на страницу создания статьи
    visit new_article_path

    # Проверка наличия заголовка страницы
    expect(page).to have_content "Создать статью"
  end
end
