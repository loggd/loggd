require 'rails_helper'

RSpec.describe Journal, type: :model do
  let(:user) { create(:user) }
  let(:journal) { create(:journal, user: user) }

  context 'validations' do
    context 'password' do
      let(:public_param) { true }
      let(:password_param) { nil }
      let(:journal) { build(:journal, user: user, public: public_param, password: password_param) }

      context 'is nil and journal is private' do
        let(:public_param) { false }
        let(:password_param) { nil }

        it('should require a password') { expect(journal).not_to be_valid }
      end

      context 'is nil and journal is public' do
        let(:public_param) { true }
        let(:password_param) { nil }

        it('should not require a password') { expect(journal).to be_valid }
      end
    end
  end
end
