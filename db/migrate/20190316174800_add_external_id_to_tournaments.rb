class AddExternalIdToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :external_id, :integer
  end
end
