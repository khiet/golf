User.destroy_all

user1      = User.create!(email: 'user1@estemity.com', password: 'password123')
user2      = User.create!(email: 'user2@estemity.com', password: 'password123')
user3      = User.create!(email: 'user3@estemity.com', password: 'password123')
admin1     = User.create!(email: 'admin1@estemity.com', password: 'password123', role: 'admin')
organizer1 = User.create!(email: 'organizer1@estemity.com', password: 'password123', role: 'organizer')
