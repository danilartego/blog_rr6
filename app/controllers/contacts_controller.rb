class ContactsController < ApplicationController
  def new
  end

  def create
    @contact = Contact.new(contact_params)
  end

  
  private

  # Метод задающий параметры для контактов
  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
