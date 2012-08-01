class Url < ActiveRecord::Base
  
  # attr_accessible :url, :@shortened_url
  validates :url, presence: true
  # validates :shortened_url, uniqueness: true
  
  
  
end
