class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
    	t.date :date
    	t.string :mode, :default=> "cash"
    	t.string :check_no

    	t.float :amt_received

      t.string :payment_status, :default=> 'pending'

      t.date  :next_date
      t.boolean   :suspended, :default=> false
      t.string  :reason

    	t.belongs_to :complaint
      t.timestamps
    end
  end
end
