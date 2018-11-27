class Room < ApplicationRecord
  has_many :messages
  has_and_belongs_to_many :users

  class << self
    def get_or_create!(users)
      get_by_users(users) || create_by_users(users)
    end

    def get_by_users(users)
      joins(:rooms_users).
        group(:id).having("count(rooms.id) == ?", users.count).
        where("rooms_users.user_id IN (?)", users.collect(&:id)).
        first
    end

    def create_by_users(users)
      create!(users: users)
    end
  end
end
