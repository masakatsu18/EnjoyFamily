class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :customer_id
      t.integer :group_id
      t.string :title
      t.string :content
      t.datetime :start_time, null: false
      t.datetime :finish_time, null: false
      t.timestamps
    end
  end
end
