class AddPokedexToPkmn < ActiveRecord::Migration[5.0]
  def change
    add_column :pkmns, :pokedex, :integer
  end
end
