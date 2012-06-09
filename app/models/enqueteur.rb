class Enqueteur < ActiveRecord::Base
  
  attr_accessible :date_enquete, :informateur, :nom
  has_many :toponymes, :dependent => :destroy
end
