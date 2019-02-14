class AddExpAndFatigueToUserpkmns < ActiveRecord::Migration[5.0]
  def change
    add_column :user_pkmns, :exp, :integer, default: 0
    add_column :user_pkmns, :fatigue, :integer, default: 0
  end
end
