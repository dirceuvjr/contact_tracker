require 'rails_helper'

RSpec.describe Contact, type: :model do

  let(:contact) { build(:contact) }

  it 'has a valid factory' do
    expect(build(:contact)).to be_valid
  end

  context 'validates' do

    context 'presence of' do

      it 'email' do
        expect(contact).to validate_presence_of(:email)
      end

    end

    it 'uniqueness of email' do
      expect(contact).to validate_uniqueness_of(:email).ignoring_case_sensitivity
    end

    context 'format of email' do

      it 'contact@example must be invalid' do
        contact.email = "contact@example"
        contact.valid?
        expect(contact.errors[:email].size).to be > 0
      end

      it 'contact@example.com must be valid' do
        contact.email = "contact@example.com"
        contact.valid?
        expect(contact.errors[:email].size).to eq(0)
      end

    end

  end

end
