require 'rails_helper'

describe UserPolicy do
  subject { UserPolicy }
  let(:target_user) { Fabricate.build(:user) }

  permissions :manage? do
    context 'for guest' do
      let(:current_user) { nil }

      it 'denies access' do
        expect(subject).to_not permit(current_user, target_user)
      end
    end

    context 'for member' do
      let(:current_user) { Fabricate.build(:user) }

      it 'denies access' do
        expect(subject).to_not permit(current_user, target_user)
      end
    end

    context 'for admin' do
      let(:current_user) { Fabricate.build(:user_admin) }

      it 'permit access' do
        expect(subject).to permit(current_user, target_user)
      end

      it 'permit access to change himself' do
        expect(subject).to permit(current_user, current_user)
      end
    end
  end
end
