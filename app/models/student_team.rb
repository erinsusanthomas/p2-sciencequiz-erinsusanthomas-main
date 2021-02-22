class StudentTeam < ApplicationRecord
  belongs_to :student
  belongs_to :team

  validates_presence_of :student_id
  validates_presence_of :team_id
  validates_presence_of :start_date
  validates_presence_of :position

  # validates_inclusion_of :state, :in => 1..5, :message => "The student's rank in team; from 1-5"
end
