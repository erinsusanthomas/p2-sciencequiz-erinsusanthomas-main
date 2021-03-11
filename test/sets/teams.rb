module Contexts 
    module Teams

        def create_teams
            @cmu_team1 = FactoryBot.create(:team, organization: @cmu)
            @arizona_team1 = FactoryBot.create(:team, name: "AST 1", division: "junior", organization: @arizona)
            @queens_team1 = FactoryBot.create(:team, name: "QU 1", active: false, organization: @queens)
            
        end

        def destroy_teams
            @cmu_team1.destroy
            @arizona_team1.destroy
            @queens_team1.destroy
        end
        
    end
end