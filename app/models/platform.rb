class Platform < ApplicationRecord
    belongs_to :game


    def self.unique_platforms
        Platform.all.uniq{|platform| platform.platforms}
    end
end
