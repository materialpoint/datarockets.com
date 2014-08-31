Fabricator(:user) do
  name Faker::Name.name
  email Faker::Internet.email
end

Fabricator(:user_admin, from: :user) do
  role :admin
end

Fabricator(:user_member, from: :user) do
  role :member
end
