# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#
#ActiveRecord::Base.transaction do
connor = User.create!({:user_name => "Connor Wallace"})
fern = User.create!({:user_name => "Fern Wood"})

poll1 = Poll.create!({:author_id => 2, :title => "POLL 1"})
poll2 = Poll.create!({:author_id => 2, :title => "POLL 2"})

question1 = Question.create!({:text => "How do you?", :poll_id => 1})
question2 = Question.create!({:text => "Why is you?", :poll_id => 2})

answerchoice1 = Answerchoice.create!({:text => "Because you is", :question_id => 1})
answerchoice2 = Answerchoice.create!({:text => "Because do the right", :question_id => 2})

response1 = Response.create!({:answerchoice_id => 1, :author_id => 1})
response2 = Response.create!({:answerchoice_id => 2, :author_id => 2})
#end