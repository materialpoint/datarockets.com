require 'rails_helper'

RSpec.describe "blog/posts/edit", :type => :view do
  before(:each) do
    @blog_post = assign(:blog_post, Blog::Post.create!())
  end

  it "renders the edit blog_post form" do
    render

    assert_select "form[action=?][method=?]", blog_post_path(@blog_post), "post" do
    end
  end
end
