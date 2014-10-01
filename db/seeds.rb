# Creating users and member profiles for them
admin_emails = %w(e.vorobiev@datarockets.com m.abramchuk@datarockets.com
  dima.zhlobo@datarockets.com e.traytyak@datarockets.com
  p.demeshchik@datarockets.com)

admin_emails.each do |email|
  name = email.split('@').first
  user = User.create(email: email, role: :admin, name: name)
  MemberInformation.create(title: 'Backend developer', description: Faker::Lorem.paragraph,
    github_profile: "http://github.com/#{name}", twitter: "http://twitter.com/#{name}",
    own_blog: "http://#{name}.blogspot.com", title: 'Backend developer',
    linkedin: "http://linkedin.com/#{name}", member: user)
end

# Creating questions with answers on them
questions = {'Why don’t you have “About” section?' => 'Because',
  'Are you an outsource company?' => 'Because',
  'Why do you have a cat in your team section?' => 'Because',
  'Can I take a look at your code?' => 'Sure'}

questions.each do |question, answer|
  Question.create(title: question, answer: answer)
end

# Creating projects with the markdown description
projects_names = %w(hata tau vkleaner)

projects_names.each_with_index do |project, index|
  project_file_path = File.join(Rails.root, "db/seeds/projects/#{project}.md")
  project_description = File.readlines(project_file_path, 'r').join
  Project.create(name: project, description: project_description,
    preview_description: Faker::Lorem.paragraph, order: index)
end

# Creating posts in the blog, pages with the markdown body
names = %w(asset_pipeline caching_with_rails getting_started)

names.each do |name|
  file_path = File.join(Rails.root, "db/seeds/posts/#{name}.md")
  body = File.readlines(file_path, 'r').join
  Post.create(title: name, body: body, preview_body: Faker::Lorem.paragraph)
  Page.create(title: name, body: body)
end
