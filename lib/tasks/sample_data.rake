namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = Employee.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 document_type:  "dni",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      document_type = "dni"
      Employee.create!(name: name,
      email: email,
      document_type: document_type)
    end

  end
end


