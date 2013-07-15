class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :name
      t.integer :value
      t.boolean :display

      t.timestamps
    end
  end
end
