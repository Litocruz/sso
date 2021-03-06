namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    require 'faker'
    9.times do |n|
      name = Faker::Name.name
      address = Faker::Address.street_address
      email = "example-#{n+1}@testing.org.net"
      document_type = "dni"
      document_number = rand(1000000...99999999) 
      password = "password"
      Employee.create!(name: name,
                       email: email,
                       address: address,
                       document_number: document_number,
                       password: password,
                       password_confirmation: password,
                       document_type: document_type)
    end
    code="AR"
    name="Argentina"
    Country.create!(code: code,
                    name: name)
  end
end
