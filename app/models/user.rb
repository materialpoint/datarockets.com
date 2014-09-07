class User < ActiveRecord::Base
  extend Enumerize

  validates :email, presence: true

  enumerize :role, in: [:member, :admin], predicates: true

  has_many :images, as: :imageable, dependent: :destroy
  has_one :member_information, foreign_key: :member_id

  before_create :generate_remember_token

  scope :members, -> { where(role: :member) }

  accepts_nested_attributes_for :member_information

  private

    def generate_remember_token
      self.remember_token = SecureRandom.hex(16)
    end
end
