
##
#
# Deck Model
#
##

class Deck < ApplicationRecord

  ##
  # Validations
  ##

  validates :course, :name, presence: true
  validates :name, uniqueness: { scope: :course_id }

  ##
  # Associations
  ##

  belongs_to :course
  
  has_many :cards,
    dependent: :destroy


end
