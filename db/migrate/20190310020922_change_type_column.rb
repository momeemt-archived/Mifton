class ChangeTypeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :contests, :type, :string
    add_column :contests, :contest_type, :string
  end
end
