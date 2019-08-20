class Platform < ApplicationRecord
    has_many :game_platforms
    has_many :games, through: :game_platforms

    # def self.unique_platforms
    #     Platform.all.uniq{|platform| platform.platforms}
    # end
end
