require 'rails_helper'

describe UserPolicy do
  subject { UserPolicy }

  permissions :manage? do
    let(:member) { Fabricate(:user) }
    let(:admin) { Fabricate(:user_admin) }

    context 'for guest' do
      let(:current_user) { nil }

      it 'denies access to change member' do
        expect(subject).to_not permit(current_user, member)
      end

      it 'denies access to change admin' do
        expect(subject).to_not permit(current_user, admin)
      end
    end

    context 'for member' do
      let(:current_user) { Fabricate.build(:user) }

      it 'denies access to change member' do
        expect(subject).to_not permit(current_user, member)
      end

      it 'denies access to change admin' do
        expect(subject).to_not permit(current_user, admin)
      end
    end

    context 'for admin' do
      let(:current_user) { Fabricate.build(:user_admin) }

      it 'permit access to change member' do
        expect(subject).to permit(current_user, member)
      end

      it 'permit access to change himself' do
        expect(subject).to permit(current_user, current_user)
      end

      it 'permit access to change admin' do
        expect(subject).to permit(current_user, admin)
      end
    end
  end
end
