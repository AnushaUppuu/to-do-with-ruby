class AddFinishedAtToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :finished_at, :datetime
  end
end
