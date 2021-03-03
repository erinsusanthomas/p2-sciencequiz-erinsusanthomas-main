class Student < ApplicationRecord
  # 1. have all proper relationships specified
  # 3. belong to an organization that is active in ScienceQuiz when first created 
  belongs_to :organization, -> { where active: true } #, class_name: 'Organization', foreign_key: 'organization_id'
  has_many :student_teams
  has_many :teams, through: :student_teams

  # 2. have a first name, last name, grade, and affiliated organization
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :grade
  validates_presence_of :organization_id

  # 4. have a grade that is at least 3rd grade and not higher than 12th grade (which one?)
  validates_inclusion_of :grade, :in => 3..12, 
                  :message => "The student's grade must be at least 3rd grade and not higher than 12th grade"
  validates_numericality_of :grade, only_integer: true, greater_than_or_equal_to: 3, less_than_or_equal_to: 12,
                  :message => "The student's grade must be at least 3rd grade and not higher than 12th grade"

  # 5. have the following scopes:
  # 	- `active` -- returns only active students
  # 	- `inactive` -- returns only inactive students
  # 	- `alphabetical` -- orders results alphabetically by student's last, first names
  # 	- `juniors` -- returns only students who are in the junior division
  # 	- `seniors` -- returns only students who are in the senior division
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :alphabetical, -> { order('last_name', 'first_name') }

  #########DOUBT################ how can i ensure that the student i enter is a junior or senior based on grade
  # scope :juniors, -> { joins(:teams).where(teams: {division: "junior"}) }
  # scope :seniors, -> { joins(:teams).where(teams: {division: "senior"}) }
  ##OR?
  scope :juniors, -> { where('grade <= 6') }
  scope :seniors, -> { where('grade > 6') }
  
  # 6.	have a method called `make_active` which changes the status from inactive to active 
  # and saves the change in the database
  # Method to change status from inactive to active and saves the change in the database
  def self.make_active
      self.active = true
      self.save!
  end

  # 7. have a method called `make_inactive` which changes the status from active to inactive 
  # and saves the change in the database
  # Method to change status from active to inactive and saves the change in the database
  def self.make_inactive
    self.active = false
    self.save!
  end

  # 8. have a method called `current_team` which return a team object representing the team the student 
  # is currently registered with, or nil if no such registration exists
  def current_team
    teamIdForStudent = StudentTeam.select(:team_id).where(student_id: self.id)
    teamInfo = Team.where(id: teamIdForStudent)
    teamInfo
  end

  # 9. have a method called `junior?` which returns true if the student is in the junior division 
  # and false otherwise  
                      ##should i do this by grade or linking to team##
  def junior?
    grade <=6
  end

  # 10. have a method called `name` which returns the student's full name as "last-name, first-name"
  def name
    last_name + ", " + first_name
  end

  # 11. have a method called `proper_name` which returns the student's full name as "first-name last-name"
  def proper_name
    first_name + " " + last_name
  end

end
