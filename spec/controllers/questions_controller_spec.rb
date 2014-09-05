RSpec.describe Admin::QuestionsController do
  let(:model_name) { :question }
  let(:pluralized_model_name) { :questions }
  let(:model_name_constant) { Question }

  it_behaves_like 'an admin controller'
end

RSpec.describe QuestionsController do
  let(:model_name) { :question }
  let(:pluralized_model_name) { :questions }
  let(:model_name_constant) { Question }

  it_behaves_like 'a controller'
end
