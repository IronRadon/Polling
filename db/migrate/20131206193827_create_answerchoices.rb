class CreateAnswerchoices < ActiveRecord::Migration
  def change
    create_table :answerchoices do |t|
      t.integer :question_id
      t.string :text

      t.timestamps
    end
    add_index :answerchoices, :question_id
    add_index :answerchoices, :text, :unique => true
  end
end
