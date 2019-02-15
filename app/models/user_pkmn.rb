class UserPkmn < ActiveRecord::Base
  belongs_to :user
  belongs_to :pkmn
  validates :fatigue, numericality: {greater_than_or_equal_to: 0}
end
