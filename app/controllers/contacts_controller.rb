class ContactsController < ApplicationController
  def new
  end

  def create
    @contact = params[:contact]
  end
end
