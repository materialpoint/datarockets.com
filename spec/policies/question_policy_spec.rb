require 'rails_helper'

describe QuestionPolicy do
  subject { QuestionPolicy } 
  let(:question) { Fabricate.build(:question) }

  context 'for guest' do
    let(:user) { nil }

    permissions :index?, :show? do
      it 'permit access' do
        expect(subject).to permit(user, question)
      end
    end

    permissions :manage? do
      it 'denies access' do
        expect(subject).not_to permit(user, question)
      end
    end
  end

  context 'for member' do
    let(:user) { Fabricate.build(:user, role: :member) }

    permissions :index?, :show? do
      it 'permit access' do
        expect(subject).to permit(user, question)
      end
    end

    permissions :manage? do
      it 'denies access' do
        expect(subject).not_to permit(user, question)
      end
    end
  end

  context 'for admin' do
    let(:user) { Fabricate.build(:user, role: :admin) }

    permissions :index?, :show? do
      it 'permit access' do
        expect(subject).to permit(user, question)
      end
    end

    permissions :manage? do
      it 'permit access' do
        expect(subject).to permit(user, question)
      end
    end
  end
end
