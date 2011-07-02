class AddAuthorableToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :authorable_id, :integer
    add_column :comments, :authorable_type, :string
    add_index :comments, :authorable_id
    add_index :comments, :authorable_type
    remove_column :comments, :user_id
  end

  def self.down
    remove_column :comments, :authorable_id
    remove_column :comments, :authorable_type
    add_column :comments, :user_id
    add_index :comments, :user_id
  end
end
