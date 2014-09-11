class Page < ActiveRecord::Base
  validates :title, :body, presence: true

  scope :reverse_all, -> { all.order(created_at: :desc) }
end
