class Response < ActiveRecord::Base
  attr_accessible :author_id, :answerchoice_id

  validates :author_id, :answerchoice_id, :presence => true
  validate :respondent_has_not_already_answered_question

  belongs_to(:author,
             :class_name => 'User',
             :foreign_key => :author_id,
             :primary_key => :id)

  belongs_to(:answer_choice,
             :class_name => 'Answerchoice',
             :foreign_key => :answerchoice_id,
             :primary_key => :id)

 #protected

 def respondent_did_not_author_poll
    response_author = self.author_id
    respondent = User.find(self.author_id)
    master_poll = Poll.joins(:questions)
                    .joins(:answer_choices)
                    .joins(:responses)
                    .where('poll.author_id = response_author')

 end

 def respondent_has_not_already_answered_question
   responses = self.existing_responses
   length = responses.length
   puts "length = #{length}"
   p responses
   unless (length == 1 && responses[0].id == self.id) || length == 0
     errors[:response] << "has already answered question"
   end
 end

  def existing_responses

    sql_query = <<-SQL
        SELECT
          responses.*
        FROM
          answerchoices
        JOIN
          responses
        ON
          answerchoices.id = responses.answerchoice_id
        WHERE
          responses.author_id = :author
        AND
          answerchoices.question_id = (SELECT
                          question_id
                        FROM
                          answerchoices
                        JOIN
                          responses
                        ON
                          (answerchoices.id = responses.answerchoice_id)
                        LIMIT 1
                        )
        SQL

    Response.find_by_sql([sql_query, :author => self.author_id])

  end

end
