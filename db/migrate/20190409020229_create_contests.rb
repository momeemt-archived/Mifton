class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.string :name
      t.integer :holding_times
      t.string :problem_1_name
      t.text :problem_1
      t.text :problem_1_answer
      t.text :submission_limit_1
      t.text :executing_sample_1
      t.text :execution_result_1
      t.text :executing_sample_1_remark
      t.string :problem_2_name
      t.text :problem_2
      t.text :problem_2_answer
      t.text :submission_limit_2
      t.text :executing_sample_2
      t.text :execution_result_2
      t.text :executing_sample_2_remark
      t.string :problem_3_name
      t.text :problem_3
      t.text :problem_3_answer
      t.text :submission_limit_3
      t.text :executing_sample_3
      t.text :execution_result_3
      t.text :executing_sample_3_remark
      t.string :problem_4_name
      t.text :problem_4
      t.text :problem_4_answer
      t.text :submission_limit_4
      t.text :executing_sample_4
      t.text :execution_result_4
      t.text :executing_sample_4_remark
      t.string :writer
      t.integer :rating
      t.integer :penalty
      t.datetime :start_time
      t.string :contest_type
      t.integer :length

      t.timestamps
    end
  end
end
