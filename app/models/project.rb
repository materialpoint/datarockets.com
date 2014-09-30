class Project < ActiveRecord::Base
  validates :name, :description, presence: true
  validates :order, uniqueness: true
  has_many :project_images
  has_many :marks
  has_many :tags, through: :marks
  has_many :workings
  has_many :developers, through: :workings
  has_one :preview_image, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :preview_image
  accepts_nested_attributes_for :tags, reject_if: ->(t) { t[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :developers

  scope :reverse_all, -> { all.order(created_at: :desc) }
  scope :includes_all, -> { includes(:tags, :preview_image, :project_images) }
  scope :sort_by_order, -> { order(order: :asc) }
end
