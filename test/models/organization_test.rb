require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # Matchers
  # Relationship matchers...
  should have_many(:teams)
  should have_many(:students)
  # Validation matchers...
  should validate_presence_of(:name)
  should validate_presence_of(:street_1)
  should validate_presence_of(:zip)
  should validate_presence_of(:short_name)

  # Validating state...
  STATES = ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 
            'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 
            'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 
            'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 
            'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY']
  should validate_inclusion_of(:state).in_array(STATES)
  should allow_value("PA").for(:state)
  should allow_value("AR").for(:state)
  should allow_value("OH").for(:state)
  should_not allow_value("state").for(:state)
  should_not allow_value(10).for(:state)
  
  # Validating zip...
  should allow_value("03431").for(:zip)
  should allow_value("15217").for(:zip)
  should allow_value("15090").for(:zip)
  should_not allow_value("fred").for(:zip)
  should_not allow_value("3431").for(:zip)
  should_not allow_value("15213-9843").for(:zip)
  should_not allow_value("15d32").for(:zip)
  should_not allow_value(nil).for(:zip)
 
  should validate_uniqueness_of(:name)
  should validate_uniqueness_of(:short_name).case_insensitive

  # Context
  context "Creating organizations context" do
    # setup method
    setup do 
      create_organizations
    end
    # teardown method 
    teardown do
      destroy_organizations
    end
    
    # now run the tests with the contexts:
    # test one of each factory (LATER)

    # test the scope 'active'
    should "shows that there are two active organizations" do
      assert_equal 2, Organization.active.size
      assert_equal ["Arizona State University", "Carnegie Mellon University"], 
                     Organization.active.map{|o| o.name}.sort
    end

    # test the scope 'inactive'
    should "shows that there is one inactive organization" do
      assert_equal 1, Organization.inactive.size
      assert_equal ["Queens University"], Organization.inactive.map{|o| o.name}.sort
    end
    
    # test the scope 'alphabetical'
    should "shows that there are three organizations in alphabetical order" do
      assert_equal ["Arizona State University", "Carnegie Mellon University","Queens University"], 
                     Organization.alphabetical.map{|o| o.name}
    end

    # test the method 'make_active' 
    should "shows that make_active method works" do
      @queens.make_active
      assert @queens.active
    end 

    # test the method 'make_inactive' 
    should "shows that make_inactive method works" do
      @cmu.make_inactive
      deny @cmu.active
    end 

  end

end
