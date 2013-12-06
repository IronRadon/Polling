class Response < ActiveRecord::Base
  attr_accessible :author_id, :question_id, :answerchoice_id

  validates :author_id, :question_id, :answerchoice_id, :presence => true

  belongs_to(:author,
             :class_name => 'User',
             :foreign_key => :author_id,
             :primary_key => :id)

  belongs_to(:answer_choice,
             :class_name => 'Answerchoice',
             :foreign_key => :answerchoice_id,
             :primary_key => :id)
end
