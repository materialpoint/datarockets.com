class ClientContactsMailer < ActionMailer::Base
  default to: 'hello@datarockets.com',
          from: 'client@datarockets.com',
          subject: I18n.t('mailers.client_contacts.subject'),
          template_path: 'mailers'

  def send_contact(contact)
    @contact = contact
    mail(from: @contact.email)
  end
end
