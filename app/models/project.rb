class Project < ActiveRecord::Base
  validates :name, :description, presence: true
  has_many :project_images

  scope :reverse_all, -> { all.order(created_at: :desc) }
end
