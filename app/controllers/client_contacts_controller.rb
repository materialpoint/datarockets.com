class ClientContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @client_contact = ClientContact.create(clien_contact_params)
    render nothing: true, status: :ok
  end

  private

    def clien_contact_params
      params.require(:client_contact).permit(:name, :email, :description)
    end
end
