class Team < ApplicationRecord
  # 1. have all proper relationships specified
  # 3. belong to an organization that is active in ScienceQuiz when first created
  belongs_to :organization, -> { where active: true } #, class_name: 'Organization', foreign_key: 'organization_id'
  has_many :student_teams
  has_many :students, through: :student_teams

  # 2. have a first name, division, and affiliated organization
  validates_presence_of :name
  validates_presence_of :organization_id
  validates_presence_of :division

  # specifications based on data dictionary provided
  validates_uniqueness_of :name

  # 4. must be in a valid division
  validates_inclusion_of :division, :in => ["senior", "junior"], 
                                :message => "Only 2 divisions: either senior or junior"

  # 5. have the following scopes:
  # 	- `active` -- returns only active teams
  # 	- `inactive` -- returns only inactive teams
  # 	- `alphabetical` -- orders results alphabetically
  # 	- `juniors` -- returns only teams who are in the junior division
  # 	- `seniors` -- returns only teams who are in the senior division
  # 	- `for_organization` -- returns all the teams for a given organization (parameter: organization)
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :alphabetical, -> { order('name') }
  scope :juniors, -> { where(division: "junior") }
  scope :seniors, -> { where(division: "senior") }

  #########DOUBT################
  # scope :for_organization, ->(organization) { where("organization_id = ?", organization) }
  scope :for_organization, ->(organization) { joins(:organization).where('organizations.name LIKE ?', "#{organization}%") }
  # scope :for_organization, ->(organization) {where("organization_id IN (?)", Organization.select(:organization_id).where('name LIKE ?', "#{organization}%")) }
  
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
end
