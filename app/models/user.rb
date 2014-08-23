class User < ActiveRecord::Base
  extend Enumerize

  validates :email, presence: true

  enumerize :role, in: [:member, :admin], predicates: true

  before_create :generate_remember_token

  private

    def generate_remember_token
      self.remember_token = SecureRandom.hex(16)
    end
end
