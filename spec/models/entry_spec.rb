require 'rails_helper'

RSpec.describe Entry, type: :model do
  let(:user) { create(:user) }
  let(:journal) { create(:journal, user: user) }
  let(:entry_body) { 'yo, dawg' }
  let(:password) { 'foo' }
  let(:entry) { create(:entry, journal: journal, body: entry_body) }

  context 'encrypt' do
    before { entry.encrypt!(password)}

    it 'should encrypt the body with a password' do
      expect(entry.body).to_not eq(entry_body)
      expect(entry.decrypted_body).to be_nil
    end

    it 'should store an IV so the value can be decrypted' do
      expect(entry.iv).to_not be_nil
    end

    it 'should be savable' do
      expect(entry.save!).to eq(true)
    end
  end

  context 'decrypt' do
    before { entry.encrypt!(password) }

    it 'should be decrypt the body and set decrypted_body' do
      entry.decrypt!(password)
      expect(entry.decrypted_body).to eq(entry_body)
    end
  end
end
