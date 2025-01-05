require "rails_helper"

describe Article do
  # Проверка на валидацию заполнения полей модели Article. Если поля не заполнены, то валидация должна вернуть false.
  describe "validation" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end

  # Проверка на наличие ассоциации между моделью Article и моделью Comment. Модель Article должна иметь много комментариев (has_many :comments).
  describe "association" do
    it { should have_many :comments }
  end

  # Тестирование метода subject модели Article. Метод должен возвращать заголовок статьи (title).
  # Метод создан через gem FactoryBot.
  describe "#subject" do
    # Тест проверяет, что метод subject возвращает заголовок статьи (title).
    it "return the article title" do
      # Создание объекта модели Article с заголовком "Lorem Ipsum" и присвоение его переменной artiсle.
      article = create(:article, title: "Lorem Ipsum")

      # Проверка того, что метод subject возвращает строку "Lorem Ipsum".
      expect(article.subject).to eq("Lorem Ipsum")
    end
  end

  describe "#last_comment" do
    it "returns the last comment" do
      # Создаем статью с 3 комментариями
      article = create(:article_with_comments)

      # Проверка
      expect(article.last_comment.body).to eq "comment body 3"
    end
  end
end