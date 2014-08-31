Fabricator(:client_contact) do
  name Faker::Name.name
  email Faker::Internet.email
  description Faker::Lorem.paragraph
end
