User.create!(
  email: 'test@test.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Admin User',
  roles: 'site_admin'
)

puts '1 Admin user created'

User.create!(
  email: 'test2@test.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Regular User'
)

puts '1 regular user created'

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

15.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: 'My very eager mother just served us nine pizzas. My very eager mother just served us nine pizzas. My very eager mother just served us nine pizzas.',
    topic_id: Topic.last.id
  )
end

puts '10 blog posts created'

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts '5 skills created'

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: 'My very eager mother just served us nine pizzas. My very eager mother just served us nine pizzas. My very eager mother just served us nine pizzas.',
    main_image: 'https://via.placeholder.com/600x400',
    thumb_image: 'https://via.placeholder.com/350x200'
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: 'Angular',
    body: 'My very eager mother just served us nine pizzas. My very eager mother just served us nine pizzas. My very eager mother just served us nine pizzas.',
    main_image: 'https://via.placeholder.com/600x400',
    thumb_image: 'https://via.placeholder.com/350x200'
  )
end

puts '9 portfolio items created'

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts '3 technologies created'
