class AddContestOption < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :type, :string # single,beginner,... の分け方
    add_column :contests, :penalty, :integer # ペナルティー時間
  end
end
