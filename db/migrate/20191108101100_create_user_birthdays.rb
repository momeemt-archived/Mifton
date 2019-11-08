class CreateUserBirthdays < ActiveRecord::Migration[5.2]
  def change
    create_table :user_birthdays do |t|
      t.date :birthday
      t.boolean :publish_years
      t.boolean :publish_date
      t.timestamps
    end
  end
end
