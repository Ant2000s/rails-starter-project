class CreateLoads < ActiveRecord::Migration[6.1]
  def change
    create_table :loads do |t|
      t.string :cover_letter
      t.string :title

      t.timestamps
    end
  end
end
