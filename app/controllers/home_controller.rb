class HomeController < ApplicationController
  # before_action :authenticate_user!

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
