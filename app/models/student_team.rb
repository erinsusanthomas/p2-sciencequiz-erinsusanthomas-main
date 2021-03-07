class StudentTeam < ApplicationRecord
  # 1. have all proper relationships specified
  # 3. be connected to a student that is active in ScienceQuiz when first created
  belongs_to :student
  # 4. be connected to a team that is active in ScienceQuiz when first created
  belongs_to :team

  # 2. have a start date, position, and affiliated student and team
  validates_presence_of :student_id
  validates_presence_of :team_id
  validates_presence_of :start_date
  validates_presence_of :position

  # 5. have a valid position
  validates_numericality_of :position, only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5,
                                                               :message => "The student's rank in team; from 1-5"

  # 6. have no start dates in the future or end dates that precede start dates
  validate :dates_validation

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
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :alphabetical, -> { joins(:student).order('students.last_name', 'students.first_name') }
  scope :chronological, -> { order('start_date') }
  scope :by_position, -> { order('position') }
  scope :captains, -> { where('position = 1') }  
  scope :for_team, ->(team) { where("team_id = ?", team) }
  scope :for_student, ->(student) {where("student_id = ?", student) }
  scope :current, -> { where("end_date IS NULL") } 
  scope :past, -> { where("end_date IS NOT NULL") }

  # 8.	have a method called `make_active` which changes the status from inactive to active 
  # and saves the change in the database
  # Method to change status from inactive to active and saves the change in the database
  def make_active
    self.active = true
    self.save!
  end

  # 9. have a method called `make_inactive` which changes the status from active to inactive 
  # and saves the change in the database
  # Method to change status from active to inactive and saves the change in the database
  def make_inactive
    self.active = false
    self.save!
  end

  # 10. have a method called `end_previous_team_assignment` -- this method will be used as a 
  # part of a callback when creating a new student-team assignment.  
  # Essentially this method and callback will update any previously open student-team assignment (if applicable) 
  # and terminate it by automatically by setting the end date of the old student-team assignment to the start date 
  # of the new student-team assignment.
  before_create :end_previous_team_assignment

  private 
  def dates_validation #have no start dates in the future or end dates that precede start dates
    if start_date > Date.today
      errors.add("The start date #{start_date} is in the future!")
    elsif end_date.blank? == false && end_date < start_date
      errors.add("The end date #{end_date} precedes the start date #{start_date}!")
    end
  end

  def end_previous_team_assignment
    previous = StudentTeam.current.for_student(self.student_id).take
    previous.update_attribute(:end_date, self.start_date) unless previous.nil?
    # previous = StudentTeam.current.for_team(self.team_id).take
    # previous.update_attribute(:end_date, self.start_date) unless previous.nil?
  end
 
end
