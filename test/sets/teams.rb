module Contexts 
    module Teams

        def create_teams
            @cmu_team1 = FactoryBot.create(:team, organization: @cmu)
            @arizona_team1 = FactoryBot.create(:team, name: "AST 1", division: "junior", organization: @arizona)
            @queens_team1 = FactoryBot.create(:team, name: "QU 1", active: false, organization: @queens)
            
        end

        def destroy_teams
            @cmu_team1.delete
            @arizona_team1.delete
            @queens_team1.delete
        end
        
    end
end