require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # Matchers
  # Relationship matchers...
  should belong_to(:organization)
  should have_many(:student_teams)
  should have_many(:students).through(:student_teams)
  # Validation matchers...
  should validate_presence_of(:name)
  should validate_presence_of(:organization_id)
  should validate_presence_of(:division)

  should validate_uniqueness_of(:name)

  should validate_inclusion_of(:division).in_array(["senior", "junior"])
  should allow_value("senior").for(:division)
  should allow_value("senior").for(:division)
  should_not allow_value("division").for(:division)
  should_not allow_value(10).for(:division)
  should_not allow_value(nil).for(:division)

  # Context
  context "Creating teams context" do
    # setup method
    setup do 
      create_organizations
      create_teams
    end
    # teardown method 
    teardown do
      destroy_teams
      destroy_organizations
    end

    # now run the tests with the contexts:
    # test one of each factory (LATER)

    # test the scope 'active'
    should "shows that there are two active teams" do
      assert_equal 2, Team.active.size
      assert_equal ["AST 1", "CMU 1"], Team.active.map{|t| t.name}.sort
    end

    # test the scope 'inactive'
    should "shows that there is one inactive team" do
      assert_equal 1, Team.inactive.size
      assert_equal ["QU 1"], Team.inactive.map{|t| t.name}.sort
    end
    
    # test the scope 'alphabetical'
    should "shows that there are three teams in alphabetical order" do
      assert_equal ["AST 1", "CMU 1","QU 1"], Team.alphabetical.map{|t| t.name}
    end

    # test the scope 'junior'
    should "shows that there is one junior team" do
      assert_equal 1, Team.juniors.size
      assert_equal ["AST 1"], Team.juniors.map{|t| t.name}.sort
    end

    # test the scope 'senior'
    should "shows that there are two senior teams" do
      assert_equal 2, Team.seniors.size
      assert_equal ["CMU 1","QU 1"], Team.seniors.map{|t| t.name}.sort
    end

    # test the scope 'for_organization'
    should "have a scope for_organization" do
      assert_equal [@cmu_team1], Team.for_organization(@cmu).sort_by{|t| t.name}
      assert_equal [@arizona_team1], Team.for_organization(@arizona).sort_by{|t| t.name}
      assert_equal [@queens_team1], Team.for_organization(@queens).sort_by{|t| t.name}
    end

    # test the method 'make_active' 
    should "shows that make_active method works" do
      @queens_team1.make_active
      assert @queens_team1.active
    end 

    # test the method 'make_inactive' 
    should "shows that make_inactive method works" do
      @cmu_team1.make_inactive
      deny @cmu_team1.active
    end

  end

end
