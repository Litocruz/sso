namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = Employee.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 document_type:  "dni",
                 document_number: 1,
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      document_type = "dni"
      document_number = rand(10029829) 
      password = "password"
      Employee.create!(name: name,
                       email: email,
                       document_number: document_number,
                       password: password,
                       password_confirmation: password,
                       document_type: document_type)
    end
  end
end
