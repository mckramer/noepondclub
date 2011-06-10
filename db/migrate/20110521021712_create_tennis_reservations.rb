class CreateTennisReservations < ActiveRecord::Migration
  def self.up
    create_table :tennis_reservations do |t|
      t.references :member
      t.date :date
      t.integer :start_at
      t.integer :end_at
      t.integer :court

      t.timestamps
    end
  end

  def self.down
    drop_table :tennis_reservations
  end
end
