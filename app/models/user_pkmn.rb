class UserPkmn < ActiveRecord::Base
  belongs_to :user
  belongs_to :pkmn
end
