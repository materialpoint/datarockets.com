RSpec.describe Admin::QuestionsController do
  it_behaves_like 'admin resource controller'
end

RSpec.describe QuestionsController do
  it_behaves_like 'public resource controller'
end
