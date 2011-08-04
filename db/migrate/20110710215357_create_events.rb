class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :allday
      t.string :where
      t.text :description
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
