class Review < ApplicationRecord
    belongs_to :game
    belongs_to :user
    validates_inclusion_of :rating, :in => 1..5
end
