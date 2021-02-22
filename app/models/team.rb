class Team < ApplicationRecord
  belongs_to :organization

  validates_presence_of :name
  validates_presence_of :organization_id
  validates_presence_of :division

  validates_uniqueness_of :name

  validates_inclusion_of :state, :in => ["senior", "junior"], 
                                :message => "Only 2 divisions: either senior or junior"
end
