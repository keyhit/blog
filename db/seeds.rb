# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: 'slava1', email: '1@1', password: '1')
user2 = User.create(name: 'slava2', email: '2@2', password: '2')
user3 = User.create(name: 'slava3', email: '3@3', password: '3')

post1 = Post.create(
  header: 'Post header 1 user 1',
  body: 'Post body 1 user 1',
  user_id: user1.id
)

post2 = Post.create(
  header: 'Post header 2 user 1',
  body: 'Post body 2 user 1',
  user_id: user1.id
)

post3 = Post.create(
  header: 'Post header 3 user 1',
  body: 'Post body 3 user 1',
  user_id: user1.id
)

post4 = Post.create(
  header: 'Post header 1 user 2',
  body: 'Post body 1 user 2',
  user_id: user2.id
)