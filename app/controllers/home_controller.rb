class HomeController < ApplicationController
  def index
    @welcome = "Добро пожаловать"
  end

  def about
    @about = "О сайте"
  end

  def terms
    @terms = "Пользовательское соглашение"
  end

end
