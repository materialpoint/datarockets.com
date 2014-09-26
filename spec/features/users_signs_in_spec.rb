require 'rails_helper'

feature 'User Signs In' do
  scenario 'User signs in using google account' do
    mock_omniauth_for(Fabricate(:user))
    visit(sign_in_path)

    expect(page).to have_content(I18n.t('flash.sessions.create.successfully_signed_in'))
  end
end
