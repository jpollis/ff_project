class CreateJobLists < ActiveRecord::Migration[5.1]
  def change
    create_table :job_lists do |t|
      
      t.timestamps
    end
  end
end
