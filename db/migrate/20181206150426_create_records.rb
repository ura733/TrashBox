class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :week, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
