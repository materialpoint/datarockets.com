Fabricator(:user) do
  name Faker::Name.name
  email Faker::Internet.email
  role :member
end

Fabricator(:user_admin, from: :user) do
  role :admin
end
