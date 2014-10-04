class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates :title, :body, :preview_body, presence: true
  has_many :post_images
  has_many :publications
  has_many :authors, through: :publications

  scope :reverse_all, -> { all.order(created_at: :desc) }
  scope :includes_all, -> { all.includes(:authors) }
end
