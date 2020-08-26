User.destroy_all


test_user = User.create!(email: "tester@lewagon.com",
  fullname: "Chef",
  title: "User",
  password: "123456",
  expertise: "coding")

puts "created new test user"

puts "Creating users"
3.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    fullname: Faker::TvShows::TheExpanse.character,
    title: ["manager","student","mentor"].sample,
    content: Faker::Lorem.paragraph(sentence_count: 2),
    about: Faker::Lorem.paragraph(sentence_count: 4),
    expertise: Faker::IndustrySegments.industry
  )

  puts "Creating Events..."
  rand(2..4).times do
    event = Event.create!(
      title: Faker::Lorem.word,
      description: Faker::Lorem.paragraph(sentence_count: 2),
      category: ['Education','Technology','Business'].sample,
      difficulty: ['Easy','Hard','Median'].sample,
      link: Faker::Internet.url(host: 'example.com'),
      user: user
    )
  end
end
