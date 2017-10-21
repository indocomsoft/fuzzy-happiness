class CreateSupervisors < ActiveRecord::Migration[5.1]
  def change
    create_table :supervisors do |t|
      t.string :fullname
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
