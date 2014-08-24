require 'rails_helper'

feature 'User Signs In' do
  scenario 'User signs in using google account' do
    visit(sign_in_path)
    mock_omniauth_for(Fabricate(:user))

    click_on 'Sign in with Google'

    expect(page).to have_content(I18n.t('flash.sessions.create.successfully_signed_in'))
  end
end
