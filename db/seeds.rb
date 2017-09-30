# 1000.times do
#   User.create!(first_name: Faker::Name.first_name,
#                 last_name: Faker::Name.last_name,
#                 email: Faker::Internet.email,
#                 password: '123456',
#                 profile_picture: Faker::Avatar.image("my-own-slug", "50x50")
#               )
# end

10.times do
  album = Album.new(title: Faker::GameOfThrones.character, caption: Faker::Hacker.say_something_smart, user_id: 1)
  album.save!
  (5..15).to_a.each do
    photo = album.photos.build(
      title: Faker::GameOfThrones.character,
      picture: Faker::Avatar.image,
      caption: Faker::Matz.quote
    )
    photo.save!
  end
end
