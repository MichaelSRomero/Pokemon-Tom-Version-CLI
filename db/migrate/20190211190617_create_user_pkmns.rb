class CreateUserPkmns < ActiveRecord::Migration[5.0]
  def change
    create_table :user_pkmns do |t|
      t.string :nickname
      t.integer :win
      t.integer :loss
      t.boolean :captured, default: false
      t.integer :user_id
      t.integer :pkmn_id
    end
  end
end
