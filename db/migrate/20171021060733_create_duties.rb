class CreateDuties < ActiveRecord::Migration[5.1]
  def change
    create_table :duties do |t|
      t.date :date
      t.boolean :dropped
      t.references :supervisor, foreign_key: true

      t.timestamps
    end
  end
end
