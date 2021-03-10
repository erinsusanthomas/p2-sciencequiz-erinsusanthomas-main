# require needed files that have the modules
require './test/sets/organizations'
require './test/sets/teams'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Organizations
  include Contexts::Teams

  def create_all
    puts "Building context..."
    create_organizations
    puts "Built organizations"
    create_teams
    puts "Built teams"
  end

end 