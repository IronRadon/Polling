class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :author_id
      t.integer :question_id
      t.integer :answerchoice_id

      t.timestamps
    end
    add_index :responses, :author_id
    add_index :responses, :question_id
    add_index :responses, :answerchoice_id
  end
end
