class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.text :title

      t.timestamps
    end
  end
end
