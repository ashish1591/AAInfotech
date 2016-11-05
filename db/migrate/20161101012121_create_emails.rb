class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :eid
      t.belongs_to :customer
      

      t.timestamps
    end
  end
end
