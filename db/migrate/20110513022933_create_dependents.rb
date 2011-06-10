class CreateDependents < ActiveRecord::Migration
  def self.up
    create_table :dependents do |t|
      t.string :name_first
      t.string :name_middle
      t.string :name_last
      t.string :email
      t.date :dob
      t.date :emblem_redfrog
      t.date :emblem_bluefrog
      t.date :emblem_greenfish
      t.date :emblem_goldfish
      t.date :emblem_redshark
      t.date :emblem_maroonshark
      t.date :emblem_silverdolphin
      t.date :emblem_goldendolphin
      t.references :member
      t.timestamps
    end
  end

  def self.down
    drop_table :dependents
  end
end
