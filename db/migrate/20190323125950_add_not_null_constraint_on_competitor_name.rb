class AddNotNullConstraintOnCompetitorName < ActiveRecord::Migration[5.2]
  def change
    change_column_null :competitors, :name, false
  end
end
