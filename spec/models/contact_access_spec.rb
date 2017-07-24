require 'rails_helper'

RSpec.describe ContactAccess, type: :model do

  let(:contact_access) { build(:contact_access) }

  it 'has a valid factory' do
    expect(build(:contact_access)).to be_valid
  end

  context 'validates' do

    context 'presence of' do

      [:contact, :url, :visiting_date].each do |f|
        it f do
          expect(contact_access).to validate_presence_of(f)
        end
      end
    end

  end

end
