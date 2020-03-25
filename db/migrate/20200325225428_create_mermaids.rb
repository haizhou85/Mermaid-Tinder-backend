class CreateMermaids < ActiveRecord::Migration[6.0]
  def change
    create_table :mermaids do |t|
      t.string :name
      t.integer :age
      t.text :enjoys

      t.timestamps
    end
  end
end
