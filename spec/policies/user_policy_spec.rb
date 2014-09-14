require 'rails_helper'

describe UserPolicy do
  subject { UserPolicy }
  let(:user_profile) { Fabricate.build(:user, role: nil) }

  permissions :manage? do
    context 'for guest' do
      let(:user) { nil }

      it 'denies access' do
        expect(subject).to_not permit(user, user_profile)
      end
    end

    context 'for member' do
      let(:user) { Fabricate.build(:user) }

      it 'denies access' do
        expect(subject).to_not permit(user, user_profile)
      end
    end

    context 'for admin' do
      let(:user) { Fabricate.build(:user_admin) }

      it 'permit access' do
        expect(subject).to permit(user, user_profile)
      end
    end
  end
end
