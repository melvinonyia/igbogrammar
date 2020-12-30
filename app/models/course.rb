
##
#
# Course Model
#
##

class Course < ApplicationRecord

  ##
  # Validations
  ##

  validates :name, presence: true

  
end
