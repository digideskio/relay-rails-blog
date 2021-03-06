ActiveRecord::Base.transaction do
  User.destroy_all
  Post.destroy_all
  Comment.destroy_all

  10.times do |i|
    User.create!(
      name: Faker::Name.name,
      username: Faker::Internet.user_name,
      password: 'password',
      email: "test#{i}@example.com"
    )
  end

  tags = ['ruby', 'react', 'javascript', 'relay', 'graphql', 'sessions', 'code', 'remote']

  100.times do
    Post.create!(
      title: Faker::Lorem.sentence,
      body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque, incidunt! Voluptatibus quasi asperiores veritatis nesciunt vitae aliquid, praesentium ratione. Repudiandae, dolor, incidunt. \nAmet corporis porro eveniet rem, eligendi vero, quae.\nScience cuts two ways, of course; its products can be used for both good and evil. But there's no turning back from science. The early warnings about technological dangers also come from science.\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam quo autem nisi nobis nemo labore explicabo repellat deserunt harum sequi amet odit, alias reiciendis quia, incidunt vel ullam totam rem?
      ",
      user_id: (1..10).to_a.sample,
      tags: tags.sample(2)
    )
  end


  5000.times do
    Comment.create!(
      body: Faker::Lorem.sentence(10),
      user_id: (1..10).to_a.sample,
      post_id: (1..100).to_a.sample
    )
  end


  Post.find((1..100).to_a).each do |votable|
    Vote.create!(
      user_id: (1..10).to_a.sample,
      votable: votable
    )
  end

  Comment.find((1..500).to_a).each do |votable|
    Vote.create!(
      user_id: (1..10).to_a.sample,
      votable: votable
    )
  end
end
