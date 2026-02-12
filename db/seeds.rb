# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = [
  { username: 'admin', password: 'password123' },
  { username: 'moderator', password: 'password123' },
  { username: 'sarah_j', password: 'hello123' },
  { username: 'mike_t', password: 'hello123' },
  { username: 'alex_k', password: 'hello123' }
]

created_users = users.map do |u|
  User.find_or_create_by!(username: u[:username]) do |user|
    user.password = u[:password]
  end
end

messages = [
  { user: created_users[0], body: 'Welcome everyone to Sidetalk!' },
  { user: created_users[1], body: 'Glad to have you all here' },
  { user: created_users[2], body: 'This chat looks great!' },
  { user: created_users[3], body: 'Hey @senutpal, thanks for setting this up' },
  { user: created_users[2], body: 'No problem! Happy to chat' },
  { user: created_users[4], body: 'Love the UI design' },
  { user: created_users[0], body: 'We have more features coming soon' },
  { user: created_users[1], body: 'Stay tuned for updates!' },
  { user: created_users[3], body: "Can't wait to see what's next" },
  { user: created_users[2], body: 'Same here!' }
]

messages.each do |m|
  Message.find_or_create_by!(body: m[:body], user: m[:user])
end
