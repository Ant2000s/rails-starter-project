class CreateLoads < ActiveRecord::Migration[6.1]
  def change
    create_table :loads do |t|
      t.string :title, presence: true
      t.integer :user_id

      t.timestamps
    end
    add_index :loads, %i[user_id title], unique: true
  end
end
