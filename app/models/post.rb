class Post < ActiveRecord::Base
  validates :title, :body, presence: true
  has_many :post_images

  scope :reverse_all, -> { all.order(created_at: :desc) }
end
