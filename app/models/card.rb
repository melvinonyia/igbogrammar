
##
#
# Card Model
#
##

class Card < ApplicationRecord

  ##
  # Validations
  ##

  validates :deck, :question, :answer, presence: true

  ##
  # Associations
  ##

  belongs_to :deck

  has_one :course,
    through: :deck,
    source: :course

end
