require 'rails_helper'

describe PagePolicy do
  subject { PagePolicy }
  let(:page) { Fabricate.build(:page) }

  context 'for guest' do
    let(:user) { nil }

    permissions :show? do
      it 'permit access' do
        expect(subject).to permit(user, page)
      end
    end

    permissions :manage? do
      it 'denies access' do
        expect(subject).not_to permit(user, page)
      end
    end
  end

  context 'for member' do
    let(:user) { Fabricate.build(:user, role: :member) }

    permissions :show? do
      it 'permit access' do
        expect(subject).to permit(user, page)
      end
    end

    permissions :manage? do
      it 'denies access' do
        expect(subject).not_to permit(user, page)
      end
    end
  end

  context 'for admin' do
    let(:user) { Fabricate.build(:user, role: :admin) }

    permissions :show? do
      it 'permit access' do
        expect(subject).to permit(user, page)
      end
    end

    permissions :manage? do
      it 'permit access' do
        expect(subject).to permit(user, page)
      end
    end
  end
end
