class Panel < ActiveRecord::Base
  validates :title, :presence => true
end
