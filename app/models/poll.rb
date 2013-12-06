class Poll < ActiveRecord::Base
  attr_accessible :title, :author_id

  belongs_to(:author,
             :class_name => 'User',
             :foreign_key => :author_id,
             :primary_key => :id)

  has_many(:questions,
           :class_name => 'Question',
           :foreign_key => :question_id,
           :primary_key => :id)

  validates :author_id, :title, :presence => true
end
