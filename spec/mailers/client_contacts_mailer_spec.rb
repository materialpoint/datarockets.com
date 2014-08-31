require 'rails_helper'

describe ClientContactsMailer do
  describe 'send_contact' do
    let(:client_contact) { Fabricate.build(:client_contact) }
    let(:mail) { ClientContactsMailer.send_contact(client_contact) }

    it 'renders the receiver email' do
      expect(mail.to).to eq(['hello@datarockets.com'])
    end

    it 'renders the subject' do
      expect(mail.subject).to eq(I18n.t('mailers.client_contacts.subject'))
    end

    it 'renders the description in view' do
      expect(mail.body).to match(client_contact.description)
    end
  end
end
