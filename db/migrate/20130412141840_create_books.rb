class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.integer :volume
      t.text :description
      t.integer :shelf_id

      t.timestamps
    end
  end
end
