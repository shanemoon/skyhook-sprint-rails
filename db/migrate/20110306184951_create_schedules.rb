class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.string :item
      t.string :place
      t.datetime :time
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
