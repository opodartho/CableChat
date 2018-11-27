class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :rooms

  scope :exclude, ->(user) { where.not(id: user.id) }

  def name
    email.split('@')[0]
  end
end
