
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

  ##
  # Associations
  ##

  has_many :decks,
    dependent: :destroy

end
