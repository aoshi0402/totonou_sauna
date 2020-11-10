class User::ContactsController < ApplicationController
 def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      User::ContactMailer.contact_mail(@contact).deliver
      flash[:notice] = "お問い合わせを送信しました"
      redirect_to root_path
    else
      flash.now[:alart_flash] = 'お問い合わせの送信に失敗しました'
      render 'new'
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :title, :body)
    end
end
