class Question < ActiveRecord::Base
  validates :title, :answer, presence: true

  scope :reverse_all, -> { all.order(created_at: :desc) }
end
