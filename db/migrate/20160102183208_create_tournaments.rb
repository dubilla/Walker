class CreateTournaments < ActiveRecord::Migration[4.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.date :start_date
      t.timestamps null: false
    end
  end
end
