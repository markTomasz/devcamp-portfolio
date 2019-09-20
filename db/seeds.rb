15.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: 'My very eager mother just served us nine pizzas. My very eager mother just served us nine pizzas. My very eager mother just served us nine pizzas.'
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

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "My greate service",
    body: 'My very eager mother just served us nine pizzas. My very eager mother just served us nine pizzas. My very eager mother just served us nine pizzas.',
    main_image: 'https://via.placeholder.com/600x400',
    thumb_image: 'https://via.placeholder.com/350x200'
  )
end

puts '9 portfolio items created'
