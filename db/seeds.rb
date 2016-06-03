# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(login: 'admin', first_name: 'Admin', last_name: 'Admin', email: 'a@a.com', password: '87654321', admin: true)
User.create!(login: 'user', first_name: 'User', last_name: 'User', email: 'u@u.com', password: '12345678', admin: false)

25.times do |i|
  login = 'login_' + i.to_s
  first_name = 'fname_' + i.to_s
  last_name = 'lname_' + i.to_s
  email = "user" + i.to_s + "@u.com"
  User.create!(login: login, first_name: first_name, last_name: last_name, email: email, password: '12345678', admin: false)
end

@date = DateTime.now

4.times do |i|
  name = 'item12'+i.to_s
  price = 120 + i
  course = '1'
  created_at = @date - 2
  Item.create!(name: name, price: price, course: course, created_at: created_at)
end

3.times do |i|
  name = 'item22'+i.to_s
  price = 220 + i
  course = '2'
  created_at = @date - 2
  Item.create!(name: name, price: price, course: course, created_at: created_at)
end

5.times do |i|
  name = 'item32'+i.to_s
  price = 320 + i
  course = '3'
  created_at = @date - 2
  Item.create!(name: name, price: price, course: course, created_at: created_at)
end

4.times do |i|
  name = 'item10'+i.to_s
  price = 100 + i
  course = '1'
  Item.create!(name: name, price: price, course: course)
end

3.times do |i|
  name = 'item20'+i.to_s
  price = 200 + i
  course = '2'
  Item.create!(name: name, price: price, course: course)
end

5.times do |i|
  name = 'item30'+i.to_s
  price = 300 + i
  course = '3'
  Item.create!(name: name, price: price, course: course)
end

4.times do |i|
  name = 'item4'+i.to_s
  price = 20 + i
  course = '1'
  created_at = @date - 1
  Item.create!(name: name, price: price, course: course, created_at: created_at)
end

3.times do |i|
  name = 'item5'+i.to_s
  price = 30 + i
  course = '2'
  created_at = @date - 1
  Item.create!(name: name, price: price, course: course, created_at: created_at)
end

5.times do |i|
  name = 'item3'+i.to_s
  price = 40 + i
  course = '3'
  created_at = @date - 1
  Item.create!(name: name, price: price, course: course, created_at: created_at)
end

# 4.times do |i|
    #   name = 'item031'+i.to_s
    #   price = 31 + i
    #   course = '1'
    #   Item.create!(name: name, price: price, course: course)
    # end

    # 3.times do |i|
    #   name = 'item032'+i.to_s
    #   price = 42 + i
    #   course = '2'
    #   Item.create!(name: name, price: price, course: course)
    # end

    # 5.times do |i|
    #   name = 'item033'+i.to_s
    #   price = 53 + i
    #   course = '3'
    #   Item.create!(name: name, price: price, course: course)
    # end
