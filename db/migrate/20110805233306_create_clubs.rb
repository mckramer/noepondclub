class CreateClubs < ActiveRecord::Migration
  def self.up
    create_table :clubs do |t|
      t.string :name
      t.string :address
      t.boolean :diving
      t.boolean :paddle
      t.boolean :swimming
      t.boolean :tennis

      t.timestamps
    end
  end

  def self.down
    drop_table :clubs
  end
end
