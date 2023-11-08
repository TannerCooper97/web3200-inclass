# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
  u = User.create(email: "admin@tutorme.com", password: "test1234", admin: true)

  Course.create!(prefix: 'WEB', num: 3200, title: 'Dynamic languages for WEB', 
    description: "TBD", created_by: u, updated_by: u
  )
end
