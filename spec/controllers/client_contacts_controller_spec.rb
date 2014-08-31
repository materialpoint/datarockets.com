require 'rails_helper'

describe ClientContactsController do
  describe '#create' do
    let(:client_contact_params) { Fabricate.attributes_for(:client_contact) }

    it 'create contact information' do
      post_create_request

      check_if_client_contact_was_saved_successfully
    end

    it 'has response with status 200' do
      post_create_request

      expect(response).to have_http_status(:ok)
    end

    def check_if_client_contact_was_saved_successfully
      name = client_contact_params[:name]
      email = client_contact_params[:email]
      description = client_contact_params[:description]

      client_contact = assigns(:client_contact)

      expect(client_contact).to be_persisted
      expect(client_contact.name).to eq(name)
      expect(client_contact.email).to eq(email)
      expect(client_contact.description).to eq(description)
    end

    def post_create_request
      post :create, client_contact: client_contact_params
    end
  end
end
