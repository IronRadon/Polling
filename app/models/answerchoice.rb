class Answerchoice < ActiveRecord::Base
  attr_accessible :text, :question_id

  validates :text, :question_id, :presence => true
  validates :text, :uniqueness => true

  belongs_to(:question,
             :class_name => 'Question',
             :foreign_key => :question_id,
             :primary_key => :id)

  has_many(:reponses,
           :class_name => 'Response',
           :foreign_key => :answerchoice_id,
           :primary_key => :id)
end
