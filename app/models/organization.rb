class Organization < ApplicationRecord
    # 1. have all proper relationships specified
    has_many :students
    has_many :teams
    # has_many :student_teams, through: :teams 
    # has_many :student_teams, through: :students 

    # 2. have a name, street 1, zip, and short name
    validates_presence_of :name
    validates_presence_of :street_1
    validates_presence_of :zip
    validates_presence_of :short_name

    # 3. only allow US states to be entered as a state
    STATES = ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 
              'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 
              'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 
              'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 
              'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY']
    validates_inclusion_of :state, :in => STATES, :message => "Only US states are valid entries"

    # 4. have a valid zip code
    validates_format_of :zip, with: /\d{5}(-\d{4})?/, message: "Zip code should be valid"

    # 5. have a short name that is unique in the system (case insensitive)
    validates_uniqueness_of :name
    validates_uniqueness_of :short_name, :case_sensitive => false

    # 6. have the following scopes:
	#     - `active` -- returns only active organizations
	#     - `inactive` -- returns only inactive organizations
	#     - `alphabetical` -- orders results alphabetically
    scope :active, -> {where(active:true)}
    scope :inactive, -> {where(active:false)}
    scope :alphabetical, -> {order(name)}

    # 7. have a method called `make_active` which changes the status from inactive to active 
    # and saves the change in the database 
    # Method to change status from inactive to active and saves the change in the database
    #
    # @return boolean
    # the status of the organization
    def self.make_active?
        self.active = true
        self.active.save!
        return self.active
    end

    # 8. have a method called `make_inactive` which changes the status from active to inactive 
    # and saves the change in the database
    # Method to change status from active to inactive and saves the change in the database
    #
    # @return boolean
    # the status of the organization
    def self.make_inactive? 
        self.active = false
        self.active.save!
        return self.active
    end
end
