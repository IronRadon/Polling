class User < ActiveRecord::Base
  attr_accessible :user_name

  has_many(:authored_polls,
    :class_name => "Poll",
    :foreign_key => :author_id,
    :primary_key => :id)

  has_many(:responses,
           :class_name => 'Response',
           :foreign_key => :author_id,
           :primary_key => :id)


  validates :user_name, :uniqueness => true, :presence => true
end
