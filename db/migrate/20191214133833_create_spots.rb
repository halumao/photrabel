class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :address
      t.string :time_open
      t.string :time_close
      t.string :day_close
      t.string :money
      t.string :prefecture
      t.string :image

      t.timestamps
    end
  end
end
