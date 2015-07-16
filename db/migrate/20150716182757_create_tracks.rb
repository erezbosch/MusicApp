class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, null: false
      t.boolean :is_bonus, null: false, default: false
      t.text :lyrics

      t.timestamps null: false
    end

    add_index :tracks, :album_id
    add_column :albums, :is_live, :boolean, default: false
  end
end
