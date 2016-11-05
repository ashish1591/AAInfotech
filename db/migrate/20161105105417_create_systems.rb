class CreateSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :systems do |t|
		t.string :category,  :default => 'computer'
		t.string :name
		t.string :number, null: false
		
      	t.belongs_to :customer

		t.timestamps
    end
  end
end
