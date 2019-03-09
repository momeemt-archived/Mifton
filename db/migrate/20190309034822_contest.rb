class Contest < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :holdingTime, :datetime
    add_column :contests, :length, :integer
    add_column :contests, :writer, :string
    add_column :contests, :rating, :integer
    remove_column :contests, :type, :string
  end
end
