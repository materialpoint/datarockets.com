require 'rails_helper'

describe PagePolicy do
  subject { PagePolicy }
  let(:page) { Fabricate.build(:page) }

  context 'for guest' do
    let(:guest) { nil }

    permissions :show? do
      it 'permit access' do
        expect(subject).to permit(guest, page)
      end
    end

    permissions :manage? do
      it 'denies access' do
        expect(subject).not_to permit(guest, page)
      end
    end
  end

  context 'for member' do
    let(:member) { Fabricate.build(:user, role: :member) }

    permissions :show? do
      it 'permit access' do
        expect(subject).to permit(member, page)
      end
    end

    permissions :manage? do
      it 'denies access' do
        expect(subject).not_to permit(member, page)
      end
    end
  end

  context 'for admin' do
    let(:admin) { Fabricate.build(:user, role: :admin) }

    permissions :show? do
      it 'permit access' do
        expect(subject).to permit(admin, page)
      end
    end

    permissions :manage? do
      it 'permit access' do
        expect(subject).to permit(admin, page)
      end
    end
  end
end
