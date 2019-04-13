class AddUserid < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :user_id, :integer
  end
end
