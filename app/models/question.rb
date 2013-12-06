class Question < ActiveRecord::Base
  attr_accessible :text, :poll_id

  validates :poll_id, :text, :presence => true
  validates :text, :uniqueness => true

  belongs_to(:poll,
             :class_name => 'Poll',
             :foreign_key => :poll_id,
             :primary_key => :id)

  has_many(:answer_choices,
           :class_name => 'Answerchoice',
           :foreign_key => :question_id,
           :primary_key => :id)
end
