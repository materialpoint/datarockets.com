RSpec.describe Admin::ProjectsController do
  let(:model_name) { :project }
  let(:pluralized_model_name) { :projects }
  let(:const_model_name) { Project }

  it_behaves_like 'an admin controller'
end

RSpec.describe ProjectsController do
  let(:model_name) { :project }
  let(:pluralized_model_name) { :projects }
  let(:const_model_name) { Project }

  it_behaves_like 'a controller'
end
