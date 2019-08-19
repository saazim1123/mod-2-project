require 'csv'

games_2018 = []

games_2018_titles = []

games_2018_platforms = []

games_2018_genres = []

CSV.foreach('./lib/seeds/games_2018.csv', headers: true) do |row|
    games_2018 << row.to_h
end


i = 1
games_2018.each do |game| 
    Game.create(title: game["Title"])
    Platform.create(game_id: i, platforms: game["Platform(s)"])
    Genre.create(game_id: i, name: game["Genre(s)"])
    i += 1
end
# games_2018.each{|game| games_2018_platforms << game["Platform(s)"]}
# games_2018.each{|game| games_2018_genres << game["Genre(s)"]}

# games_2018_titles.each do |game|
#  Game.create(title: game)
# end

# Game.all.each do |g|
#     games_2018_platforms.each do |game|
#         Platform.create(game_id: g.id, platforms: game)
#     end
# end

puts "data loaded success"