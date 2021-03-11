module Contexts 
    module Organizations

        def create_organizations
            @cmu = FactoryBot.create(:organization)
            @arizona = FactoryBot.create(:organization, name: "Arizona State University", short_name: "ASU", state: "AR")
            @queens = FactoryBot.create(:organization, name: "Queens University", short_name: "QU", active: false)
            
        end

        def destroy_organizations
            @cmu.destroy
            @arizona.destroy
            @queens.destroy
        end

    end
end