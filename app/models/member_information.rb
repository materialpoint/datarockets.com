class MemberInformation < ActiveRecord::Base
  belongs_to :member, class_name: :User
end
