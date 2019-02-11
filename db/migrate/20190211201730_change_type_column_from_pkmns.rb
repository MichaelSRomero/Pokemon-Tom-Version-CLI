class ChangeTypeColumnFromPkmns < ActiveRecord::Migration[5.0]
  def change
    rename_column :pkmns, :type, :element
  end
end
