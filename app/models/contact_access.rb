class ContactAccess < ApplicationRecord
  belongs_to :contact

  validates_presence_of :contact, :url, :visiting_date
end
