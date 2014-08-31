require 'rails_helper'

RSpec.describe "blog/posts/show", :type => :view do
  before(:each) do
    @blog_post = assign(:blog_post, Blog::Post.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
