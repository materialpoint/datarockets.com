Fabricator(:question) do
  title { Faker::Lorem.sentence }
  answer { Faker::Lorem.paragraph } 
end
