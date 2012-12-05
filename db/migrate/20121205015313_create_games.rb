class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :sport
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :venue_id
      t.text :details
      t.integer :maxpax
      t.integer :host_id

      t.timestamps
    end
  end
end
