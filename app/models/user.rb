class User < ActiveRecord::Base
  has_many :user_pkmns
  has_many :pkmns, through: :user_pkmns
end
