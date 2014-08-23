class User < ActiveRecord::Base
  validates :email, presence: true

  enumerize :role, in: [:member, :admin], predicates: true
end
