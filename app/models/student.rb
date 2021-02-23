class Student < ApplicationRecord
  belongs_to :organization
  has_many :student_teams
  has_many :teams, through: :student_teams

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :grade
  validates_presence_of :organization_id
end
