class AddTimeAndCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :start_time, :time
    add_column :contests, :category, :string
  end
end
