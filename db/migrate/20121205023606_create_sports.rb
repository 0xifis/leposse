class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name

      t.timestamps
    end
    remove_column :games, :sport
    add_column :games, :sport_id, :integer
  end
end
