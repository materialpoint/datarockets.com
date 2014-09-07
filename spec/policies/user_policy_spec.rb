require 'rails_helper'

describe UserPolicy do
  subject { UserPolicy }
  let(:user_profile) { Fabricate.build(:user) }

  permissions :index?, :show? do
    context 'for guest' do
      let(:user) { nil }

      it 'denies access' do
        expect(subject).to_not permit(user, user_profile)
      end
    end

    context 'for member' do
      let(:user) { Fabricate.build(:user_member) }

      it 'denies access' do
        expect(subject).to_not permit(user, user_profile)
      end
    end

    context 'for admin' do
      let(:user) { Fabricate.build(:user_admin) }

      it 'denies access' do
        expect(subject).to_not permit(user, user_profile)
      end
    end
  end
end
