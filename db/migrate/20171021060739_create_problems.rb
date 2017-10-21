class CreateProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :problems do |t|
      t.integer :computer
      t.timestamp :time
      t.text :details
      t.boolean :fixed
      t.references :supervisor, foreign_key: true

      t.timestamps
    end
  end
end
