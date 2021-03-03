class StudentTeam < ApplicationRecord
  # 1. have all proper relationships specified
  # 3. be connected to a student that is active in ScienceQuiz when first created
  belongs_to :student, -> { where active: true } #, class_name: 'Student', foreign_key: 'student_id'
  # 4. be connected to a team that is active in ScienceQuiz when first created
  belongs_to :team, -> { where active: true } #, class_name: 'Team', foreign_key: 'team_id'

  # 2. have a start date, position, and affiliated student and team
  validates_presence_of :student_id
  validates_presence_of :team_id
  validates_presence_of :start_date
  validates_presence_of :position

  # 5. have a valid position (which one?)
  validates_inclusion_of :position, :in => 1..5, :message => "The student's rank in team; from 1-5"
  validates_numericality_of :position, only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5,
                                                               :message => "The student's rank in team; from 1-5"


  # 6. have no start dates in the future or end dates that precede start dates

  # 7. have the following scopes:
  # 	- `active` -- returns only active teams
  # 	- `inactive` -- returns only inactive teams
  # 	- `alphabetical` -- orders results alphabetically by student's last, first names
  # 	- `chronological` -- orders results chronologically by start_date
  # 	- `by_position` -- orders results by position
  # 	- `captains` -- returns only records for the #1 ranked member of each team
  # 	- `for_team` -- returns all the records for a given team (parameter: team)
  # 	- `for_student` -- returns all the records for a given student (parameter: student)
  # 	- `current` -- returns all the current student-team assignments
  # 	- `past` -- returns all the past student-team assignments

  # 8.	have a method called `make_active` which changes the status from inactive to active 
  # and saves the change in the database

  # 9. have a method called `make_inactive` which changes the status from active to inactive 
  # and saves the change in the database

  # 10. have a method called `end_previous_team_assignment` -- this method will be used as a 
  # part of a callback when creating a new student-team assignment. (Callbacks will be explained later in class). 
  # Essentially this method and callback will update any previously open student-team assignment (if applicable) 
  # and terminate it by automatically by setting the end date of the old student-team assignment to the start date 
  # of the new student-team assignment.

end
