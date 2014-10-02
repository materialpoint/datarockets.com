class ClientContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  protect_from_forgery except: :create

  def create
    @client_contact = ClientContact.create(clien_contact_params)
    ClientContactsMailer.send_contact(@client_contact).deliver
    redirect_to(root_path, notice: st('mailers.messages.success'))
  end

  private

    def clien_contact_params
      params.require(:client_contact).permit(:name, :email, :description)
    end
end
