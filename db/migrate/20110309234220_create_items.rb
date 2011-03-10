class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.integer :prepTime
      t.integer :order_id
      t.string :username

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
