class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
      t.string 	:issue
      t.string 	:problem_type, :default=> 'hardware'
      t.string 	:priority, :default=> 'low'
      t.time 	:closing_date
      
      t.string  :problem_status, :default=> 'new'
      t.boolean   :suspended, :default=> false
      t.string 	:reason

      t.belongs_to :complaint
      t.timestamps
    end
  end
end
