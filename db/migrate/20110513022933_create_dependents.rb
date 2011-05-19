class CreateDependents < ActiveRecord::Migration
  def self.up
    create_table :dependents do |t|
      t.string :name_first
      t.string :name_middle
      t.string :name_last
      t.string :email
      t.date :dob
      t.date :badge_redfrog
      t.date :badge_bluefrog
      t.date :badge_greenfish
      t.date :badge_goldfish
      t.date :badge_redshark
      t.date :badge_maroonshark
      t.date :badge_silverdolphin
      t.date :badge_goldendolphin
      t.timestamps
    end
  end

  def self.down
    drop_table :dependents
  end
end
