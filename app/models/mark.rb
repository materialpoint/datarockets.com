class Mark < ActiveRecord::Base
  belongs_to :project
  belongs_to :tag
end
