class AddAuthorableToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :authorable_id, :integer
    add_column :posts, :authorable_type, :string
    add_index :posts, :authorable_id
    add_index :posts, :authorable_type
  end

  def self.down
    remove_column :posts, :authorable_id
    remove_column :posts, :authorable_type
  end
end
