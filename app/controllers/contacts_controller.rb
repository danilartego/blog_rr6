class ContactsController < ApplicationController
  def new
    # @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      @contact.save
    else
      render action: "new"
    end
  end

  private

  # Метод задающий параметры для контактов
  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
