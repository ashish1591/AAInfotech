class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :number
      t.belongs_to :customer

      t.timestamps
    end
  end
end
