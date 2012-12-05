class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :opening_hours
      t.string :locality

      t.timestamps
    end
  end
end
