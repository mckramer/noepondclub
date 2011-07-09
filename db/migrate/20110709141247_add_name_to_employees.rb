class AddNameToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :name_last, :string
    add_column :employees, :name_first, :string
  end

  def self.down
    remove_column :employees, :name_first
    remove_column :employees, :name_last
  end
end
