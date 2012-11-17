class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :short_name
      t.references :unit
      t.references :category
      t.boolean :active

      t.timestamps
    end
    add_index :items, :unit_id
    add_index :items, :category_id
  end
end
