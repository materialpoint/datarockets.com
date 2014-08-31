require 'rails_helper'

RSpec.describe "blog/posts/index", :type => :view do
  before(:each) do
    assign(:blog_posts, [
      Blog::Post.create!(),
      Blog::Post.create!()
    ])
  end

  it "renders a list of blog/posts" do
    render
  end
end
