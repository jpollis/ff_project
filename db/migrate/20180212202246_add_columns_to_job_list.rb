class AddColumnsToJobList < ActiveRecord::Migration[5.1]
  def change
    add_column :job_lists, :title, :string
    add_column :job_lists, :description, :string
    add_column :job_lists, :company, :string
    add_column :job_lists, :linkedin, :string
    add_column :job_lists, :glassdoor, :string

  end
end
