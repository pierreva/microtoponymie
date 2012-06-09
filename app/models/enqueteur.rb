class Enqueteur < ActiveRecord::Base
  attr_accessible :date_enquete, :informateur, :nom
end
