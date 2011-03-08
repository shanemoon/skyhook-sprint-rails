class CreateRawInputs < ActiveRecord::Migration
  def self.up
    create_table :raw_inputs do |t|
      t.string :input

      t.timestamps
    end
  end

  def self.down
    drop_table :raw_inputs
  end
end
