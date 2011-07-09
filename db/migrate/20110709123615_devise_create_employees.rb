class DeviseCreateEmployees < ActiveRecord::Migration
  def self.up
    create_table(:employees) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      
      t.integer :height
      t.integer :weight
      t.string :bio
      t.string :cell
      t.string :college
      t.string :highschool
      t.string :hometown
      t.string :phone
      t.string :cell
      t.string :roles
      
      t.timestamps
    end

    add_index :employees, :email,                :unique => true
    add_index :employees, :reset_password_token, :unique => true
    add_index :employees, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :employees
  end
end
