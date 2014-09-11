class User < ActiveRecord::Base
  extend Enumerize

  validates :email, presence: true

  enumerize :role, in: [:member, :admin], predicates: true

  has_one :avatar, class_name: 'Image', as: :imageable,
    dependent: :destroy
  has_one :member_information, foreign_key: :member_id

  before_create :generate_remember_token

  scope :members, -> { where(role: :member) }
  scope :reverse_all, -> { all.order(created_at: :desc) }

  accepts_nested_attributes_for :member_information
  accepts_nested_attributes_for :avatar

  private

    def generate_remember_token
      self.remember_token = SecureRandom.hex(16)
    end
end
