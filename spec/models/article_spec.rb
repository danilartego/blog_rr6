require "rails_helper"


describe Article do
  describe "validation" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body}
  end

  describe "association" do
    it { should have_many :comments }
  end

  describe "#subject" do
    it "return the article title" do
      # Создание объекта модели Article с заголовком "Lorem Ipsum" и присвоение его переменной artiсle.
      article = create(:article, title: "Lorem Ipsum")
    
      # Проверка того, что метод subject возвращает строку "Lorem Ipsum".
      expect(article.subject).to eq("Lorem Ipsum")
    end
  end
end
