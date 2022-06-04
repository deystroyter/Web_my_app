class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :name
      t.string :file
      t.float :avg_value
      t.integer :theme_id

      t.timestamps
    end
  end
end
