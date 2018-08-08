puts 'Creating course...'
5.times do
  Course.create!(
    name: Faker::Company.name,
    tagline: Faker::Company.catch_phrase
  )
end
puts 'Finished!'


Upvote.create!(user :?, product: ?)