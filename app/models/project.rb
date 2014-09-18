class Project < ActiveRecord::Base
  validates :name, :description, presence: true
  has_many :project_images
  has_one :preview_image, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :preview_image

  scope :reverse_all, -> { all.order(created_at: :desc) }
end
