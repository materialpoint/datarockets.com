Fabricator(:page) do
  title { Faker::Lorem.sentence }
  body { Faker::Lorem.paragraph }
end
