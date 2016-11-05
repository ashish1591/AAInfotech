class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.belongs_to :customer
      

      t.timestamps
    end
  end
end
