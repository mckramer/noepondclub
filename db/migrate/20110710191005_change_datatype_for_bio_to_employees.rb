class ChangeDatatypeForBioToEmployees < ActiveRecord::Migration
  def self.up
    change_table :employees do |t|
      t.change :bio, :text
    end
  end

  def self.down
    change_table :employees do |t|
      t.change :bio, :string
    end
  end
end
