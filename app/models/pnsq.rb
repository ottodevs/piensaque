class Pnsq < ActiveRecord::Base

  belongs_to :user
  has_many :tags, :dependent => :destroy

end