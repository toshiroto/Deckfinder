class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :colors
      t.string :text
      t.string :imageUrl

      t.timestamps
    end
  end
end
