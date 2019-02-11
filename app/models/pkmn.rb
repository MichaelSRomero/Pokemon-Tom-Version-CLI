class Pkmn < ActiveRecord::Base
  has_many :user_pkmns
  has_many :users, through: :user_pkmns
end
