class AddBaseExpToPkmn < ActiveRecord::Migration[5.0]
  def change
    add_column :pkmns, :base_experience, :integer
  end
end
