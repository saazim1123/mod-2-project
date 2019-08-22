require 'csv'

good_things = [
    "This game is great, buy it", 
    "Love this game so much, spent 100s of hours on it",
    "You gotta love it.",
    "Whoa! Can you believe this only cost me £50???",
    "Damn guys, you made a DOPE A#! Game!",
    "Game of the year? No? Who's with me?",
    "YOOOOOOOO, DUUUUUUUUDE!"
]

bad_things = [
    "Rating says it all, ain't wasting my time saying more.",
    "Take it back to the shop, throw it at the sales assistant who sold it to you and never return.",
    "Wow, you did, you made the worst game ever!!!!",
    "RUBBISH!!!!!",
    "My life, I have wasted my life.",
    "Terrible."
]

ok_things = [
    "it's literally, ok...",
    "Not bad, not great",
    "Meh",
    "I think the next one will be much better",
    "I wouldn't play it again, was ok but no replay value."
]

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
    gen = game["Genre(s)"].split(", ")
    p.each{|platform| GamePlatform.create(game_id: g.id, platform_id: Platform.find_or_create_by(name: platform).id)}
    gen.each{|genre| GameGenre.create(game_id: g.id, genre_id: Genre.find_or_create_by(name: genre).id)}
end


# i = 1
# games_2018.each do |game| 
#     Game.create(title: game["Title"])
#     Platform.create(game_id: i, name: game["Platform(s)"])
#     Genre.create(game_id: i, name: game["Genre(s)"])
#     i += 1
# end

User.create(email: "rod@rod.com", password: "password")
User.create(email: "todd@todd.com", password: "password")
User.create(email: "jim@jim.com", password: "password")
User.create(email: "tim@tim.com", password: "password")
User.create(email: "nick@nick.com", password: "password")
User.create(email: "adnan@adnan.com", password: "password")
User.create(email: "mary@mary.com", password: "password")
User.create(email: "harry@harry.com", password: "password")
User.create(email: "eliot@eliot.com", password: "password")
User.create(email: "anderson@anderson.com", password: "password")
User.create(email: "joe@joe.com", password: "password")
User.create(email: "wachira@wachira.com", password: "password")

Review.create(rating: 5, content: "Great Game, variety of play styles just by choosing a weapon! 100s of hours worth of game time means you really get your money's worth!", user_id: 1, game_id: 18)


1000.times do
review = Review.new
review.rating = rand(5) 
    if review.rating > 3
        review.content = good_things.sample 
    elsif review.rating == 3
        review.content = ok_things.sample
    elsif review.rating < 3
        review.content = bad_things.sample
    end
        review.user_id = rand(12) 
        review.game_id = rand(500)
review.save
end

puts "data loaded success"