1000.times do
  User.create!(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: '123456',
                profile_picture: "http://via.placeholder.com/50x50"
              )
end