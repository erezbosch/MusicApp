class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null:false

      t.timestamps null: false
    end

    add_column :albums, :band_id, :integer
    change_column :albums, :band_id, :integer, null: false
    add_index :albums, :band_id
  end
end
