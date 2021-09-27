class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.text :url
      t.string :slug
      t.integer :clicked
      t.integer :created_by
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :links, :created_by
  end
end
