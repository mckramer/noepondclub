class CreateIndependents < ActiveRecord::Migration
  def self.up
    create_table :independents do |t|
      t.string :name_first
      t.string :name_middle
      t.string :name_last
      t.string :name_suffix
      t.string :email
      t.string :phone
      t.references :member

      t.timestamps
    end
  end

  def self.down
    drop_table :independents
  end
end
