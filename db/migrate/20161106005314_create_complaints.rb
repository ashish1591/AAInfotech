class CreateComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :complaints do |t|
      t.time 	:date
      t.float 	:amt_total
      t.time 	:closing_date

      t.belongs_to :customer
      t.belongs_to :system

      t.string :complaint_status, :default=> 'new'

      t.boolean   :suspended, :default=> false
      t.string  :reason
      t.timestamps
    end
  end
end
