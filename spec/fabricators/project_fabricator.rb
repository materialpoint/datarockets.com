Fabricator(:project) do
  name { Faker::Lorem.word }
  description { Faker::Lorem.paragraph }
end
