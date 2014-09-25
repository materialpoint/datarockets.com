class Working < ActiveRecord::Base
  belongs_to :project
  belongs_to :developer, class_name: 'User', foreign_key: 'user_id'
end
