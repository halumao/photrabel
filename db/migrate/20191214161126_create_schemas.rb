class CreateSchemas < ActiveRecord::Migration[5.2]
  def change
    create_table :schemas do |t|
      t.integer  :prefecture,default: 0, null: false, limit: 1
      t.timestamps
    end
  end
end
