# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

turma = []
3.times do
    turma.append Classroom.create!(
        identification: Faker::Fantasy::Tolkien.character
    )
end

turma.each do |t|
    3.times do 
        Student.create!(
            full_name: Faker::Name.name,
            responsible: Faker::Name.name,
            email: Faker::Internet.email,
            birthdate: rand(10.years).seconds.from_now,
            username: Faker::Name.name,
            classroom: t
        )
    end
end
