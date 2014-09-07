RSpec.describe Admin::PostsController do
  let(:model_name) { :post }
  let(:pluralized_model_name) { :posts }
  let(:const_model_name) { Post }

  it_behaves_like 'an admin controller'
end

RSpec.describe Blog::PostsController do
  let(:model_name) { :post }
  let(:pluralized_model_name) { :posts }
  let(:const_model_name) { Post }

  it_behaves_like 'a controller'
end
