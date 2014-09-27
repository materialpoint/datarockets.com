class Post < ActiveRecord::Base
  validates :title, :body, :preview_body, presence: true
  has_many :post_images
  has_many :publications
  has_many :authors, through: :publications

  scope :reverse_all, -> { all.order(created_at: :desc) }
end
