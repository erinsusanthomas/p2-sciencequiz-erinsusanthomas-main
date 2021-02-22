class Student < ApplicationRecord
  belongs_to :organization

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :grade
  validates_presence_of :organization_id
end
