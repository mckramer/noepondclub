class AddTwitterToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :twitter, :string
  end

  def self.down
    remove_column :employees, :twitter
  end
end
