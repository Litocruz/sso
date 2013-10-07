namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    require 'faker'
    99.times do |n|
      name = Faker::Name.name
      address = Faker::Address.street_address
      email = "example-#{n+1}@testing.org.net"
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
  end
end
