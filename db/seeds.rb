COURSE_NUMBER = 30
AVG_LESSONS_PER_COURSE = 8

User.create!(email: "admin@example.com",
             password: "password",
             password_confirmation: "password",
             confirmed_at: Time.zone.now)

(1..2).each do |number|
  User.create!(email: "student#{number}@example.com",
               password: "password",
               password_confirmation: "password",
               confirmed_at: Time.zone.now)
  end

COURSE_NUMBER.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user: User.first,
    short_description: Faker::Quote.famous_last_words,
    language: Course::LANGUAGES.sample.to_s,
    level: Course::LEVELS.sample.to_s,
    price: Faker::Number.between(from: 1000, to: 20000)}])
end

(COURSE_NUMBER * AVG_LESSONS_PER_COURSE).times do
  course = Course.order(Arel.sql('Random()')).first
  course.lessons.create!([{
    title: Faker::Educator.subject,
    content: Faker::TvShows::SiliconValley.quote
  }])
end
