Fabricator(:project) do
  name { Faker::Lorem.sentence }
  description { Faker::Lorem.paragraph }
  order { Faker::Number.number(2) }
end
