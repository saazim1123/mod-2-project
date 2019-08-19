class Game < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :reviews
    has_one_attached :game_image
end
