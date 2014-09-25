class User < ActiveRecord::Base
  extend Enumerize

  validates :email, presence: true

  enumerize :role, in: [:member, :admin], default: :member, predicates: true

  has_many :publications
  has_many :posts, through: :publications
  has_many :workings
  has_many :projects, through: :workings

  has_one :member_information, foreign_key: :member_id
  has_one :avatar, dependent: :destroy

  before_create :generate_remember_token

  scope :reverse_all, -> { all.order(created_at: :desc) }

  accepts_nested_attributes_for :member_information
  accepts_nested_attributes_for :avatar

  private

    def generate_remember_token
      self.remember_token = SecureRandom.hex(16)
    end
end
