require 'rails_helper'

RSpec.describe "Blog::Posts", :type => :request do
  describe "GET /blog_posts" do
    it "works! (now write some real specs)" do
      get blog_posts_path
      expect(response.status).to be(200)
    end
  end
end
