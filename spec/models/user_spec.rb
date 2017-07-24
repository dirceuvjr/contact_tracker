require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user) }

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  context 'validates' do

    context 'presence of' do

      it 'email' do
        expect(user).to validate_presence_of(:email)
      end

      context 'on create' do
        [:password, :password_confirmation].each do |attr_sym|
          it attr_sym do
            expect(user).to validate_presence_of(attr_sym).on(:create)
          end
        end
      end

      it 'confirmation of password' do
        expect(user).to validate_confirmation_of(:password)
      end

      it 'uniqueness of email' do
        expect(user).to validate_uniqueness_of(:email).ignoring_case_sensitivity
      end

    end

    context 'format of email' do

      it 'user@example must be invalid' do
        user.email = "user@example"
        user.valid?
        expect(user.errors[:email].size).to be > 0
      end

      it 'user@example.com must be valid' do
        user.email = "user@example.com"
        user.valid?
        expect(user.errors[:email].size).to eq(0)
      end

    end

  end
end
