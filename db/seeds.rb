User.create!(email: "admin@example.com",
             password: "password",
             password_confirmation: "password",
             confirmed_at: Time.zone.now)

30.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user: User.first,
    short_description: Faker::Quote.famous_last_words,
    language: Faker::ProgrammingLanguage.name,
    level: 'Beginner',
    price: Faker::Number.between(from: 1000, to: 20000)}])
end
