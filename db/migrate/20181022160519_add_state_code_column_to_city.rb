class AddStateCodeColumnToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :state_code, :string
  end
end
