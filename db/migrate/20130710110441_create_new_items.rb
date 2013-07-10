class CreateNewItems < ActiveRecord::Migration
  def change
    create_table :new_items do |t|
      t.string :itemtype
      t.string :itemid

      t.timestamps
    end
  end
end
