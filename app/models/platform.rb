class Platform < ApplicationRecord
    belongs_to :game

    def self.platforms
        
    end

    def self.unique_platforms
        Platform.all.uniq{|platform| platform.platforms}
    end
end
