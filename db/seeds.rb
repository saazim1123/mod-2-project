require 'csv'

games_2018 = []

platforms = ["Win", "Mac", "NS", "PS4", "XBO", "PS3", "PSVita"]

# games_2018_titles = []

# games_2018_platforms = []

# games_2018_genres = []

CSV.foreach('./lib/seeds/games_2018.csv', headers: true) do |row|
    games_2018 << row.to_h
end

platforms.each do |platform|
    Platform.create(name: platform)
end

games_2018.each do |game|
    g = Game.create(title: game["Title"])
    p = game["Platform(s)"].split(", ")
    p.each{|platform| GamePlatform.create(game_id: g.id, platform_id: Platform.find_or_create_by(name: platform).id)}
end


# i = 1
# games_2018.each do |game| 
#     Game.create(title: game["Title"])
#     Platform.create(game_id: i, name: game["Platform(s)"])
#     Genre.create(game_id: i, name: game["Genre(s)"])
#     i += 1
# end

puts "data loaded success"