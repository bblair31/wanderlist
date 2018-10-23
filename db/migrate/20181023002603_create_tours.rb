class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :duration
      t.text :contact_info
      t.integer :city_id

      t.timestamps
    end
  end
end
