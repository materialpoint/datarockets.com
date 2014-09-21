class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :marks
  has_many :projects, through: :marks
end
