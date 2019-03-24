class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.string :name
      t.integer :times
      t.string :type
      t.string :q1title
      t.text :q1
      t.string :q2title
      t.text :q2
      t.string :q3title
      t.text :q3
      t.string :q4title
      t.text :q4

      t.timestamps
    end
  end
end
