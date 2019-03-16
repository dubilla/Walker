class AddCompetitors < ActiveRecord::Migration[5.2]
  def change
    create_table :competitors do |t|
      t.string :name
      t.integer :score
      t.references :tournament
      t.timestamps null: false
    end
  end
end
