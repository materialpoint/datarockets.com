module Controllers
  module ErrorsHelper
    def it_requires_authentication(&block)
      it 'requires authentication' do
        instance_exec(&block)

        expect(response).not_to be_successful
        expect(flash[:alert]).to eq(I18n.t('errors.unauthenticated'))
      end
    end
  end
end
