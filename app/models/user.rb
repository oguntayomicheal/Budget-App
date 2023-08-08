class User < ApplicationRecord
    has_many :categories, foreign_key: :user_id
    has_many :products, foreign_key: :user_id

    validates :name, presence: true, uniqueness: true
end
