RSpec.describe Admin::ProjectsController do
  it_behaves_like 'admin resource controller'
end

RSpec.describe ProjectsController do
  it_behaves_like 'public resource controller'
end
