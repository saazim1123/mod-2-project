require 'csv'

games_2018 = []

games_2018_titles = []

games_2018_platforms = []

games_2018_genres = []

CSV.foreach('./lib/seeds/games_2018.csv', headers: true) do |row|
    games_2018 << row.to_h
end

games_2018.each do |game|
    games_2018_titles << game["Title"]
    games_2018_platforms << game["Platform(s)"]
    games_2018_genres << game["Genre(s)"]
end

games_2018_titles.each do |title|
    Game.create(title: title)
end

i = 1
games_2018_platforms.each do |platform| 
    Platform.create(game_id: Game.find(i).id, platforms: platform.split(", "))
    i += 1
   
end
# games_2018_platforms.each do |platform| 
#     Platform.create(game_id: Game.find(i).id, platforms: platform)
#     i += 1
# end

i = 1
games_2018_genres.each do |genre|
    Genre.create(game_id: Game.find(i).id, name: genre)
    i += 1
end

# games_2018_genres.each do |genre|
#     Game.all.each do |game|
#         Genre.create(game_id: game.id, name: genre)
#     end
# end

# i = 1
# games_2018.each do |game| 
#     Game.create(title: game["Title"])
#     Platform.create(game_id: i, platforms: game["Platform(s)"])
#     Genre.create(game_id: i, name: game["Genre(s)"])
#     i += 1
# end
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