namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    require 'faker'
    admin = Employee.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 document_type:  "dni",
                 document_number: 1,
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      address = Faker::Address.street_address
      email = "example-#{n+1}@railstutorial.org"
      document_type = "dni"
      document_number = rand(10029829) 
      password = "password"
      Employee.create!(name: name,
                       email: email,
                       address: address,
                       document_number: document_number,
                       password: password,
                       password_confirmation: password,
                       document_type: document_type)
    end

    employees = Employee.all(limit: 6)
    2.times do
      code = Faker::Lorem.characters(char_count=1) + (rand(10-1)+1).to_s
      expiration = (rand(10-1)+1).days.ago.to_date
      employees.each { |employee| employee.driver_licenses.create!(code: code) }
    end

  end
end
