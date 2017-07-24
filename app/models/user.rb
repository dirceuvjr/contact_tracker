class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true, email: true
  validates :password, confirmation: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

end
