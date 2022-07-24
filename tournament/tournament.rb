module Tournament
  WIN_POINTS = 3
  DRAW_POINTS = 1

  def self.tally(input)
    print_table(input)
  end
  
  private 
  
  def self.print_table(input)
    team_data = categorize_data_by_teams(input)
    sort_results(team_data)
    
    table_header = "Team                           | MP |  W |  D |  L |  P\n"
    table = table_header

    team_data.each do |team|
      place_holder = ' ' * 30
      team_name = team[:team]
      
      place_holder.slice!(0...team_name.length)

      table << "#{place_holder.prepend(team_name)} |  #{team[:mp]} |  #{team[:w]} |  #{team[:d]} |  #{team[:l]} |  #{team[:p]}\n"
    end
  
    table
  end

  # Sorts by inverted points -team[:p] to organize in descendent order, then, sort by team name
  def self.sort_results(table_entries_by_teams)
    table_entries_by_teams.sort_by!{ |team| [-team[:p],team[:team]] }
end

  #Organizes data separating by teams and their results
  def self.categorize_data_by_teams(input)
    games_data = categorize_data_by_games(input)

    # array of hashes to hold a team and its result
    table_entries_by_teams = []
    
    # Computes results by the first team (team1) in the hash. Ocassion where the :result value belongs to that team
    # {:team1=>"Allegoric Alaskans", :team2=>"Blithering Badgers", :result=>"win"} 
    games_data.each_index do |i|
      team_data = {:team => '', :mp => 0, :w => 0, :d => 0, :l => 0, :p => 0} 
      
      # Checks if the list has already an entry for that team 
      index = team_exists(table_entries_by_teams, games_data[i][:team1])
      # if there is already an entry for the team
      if index >= 0
        # Reference to the team hash obj
        team_data = table_entries_by_teams[index]
        computes_team1_results(games_data, team_data, i)
      # team has no entry just yet
      else
        # add an entry for that team
        team_data.store(:team, games_data[i][:team1])
        computes_team1_results(games_data,team_data,i)
        table_entries_by_teams.push(team_data)
      end
    end
    
    # Computes results by the second team (team2) in the hash. Ocassion where the :result value is the oposite for that team
    # {:team1=>"Allegoric Alaskans", :team2=>"Blithering Badgers", :result=>"win"} 
    games_data.each_index do |i|
      team_data = {:team => '', :mp => 0, :w => 0, :d => 0, :l => 0, :p => 0} 
      
      index = team_exists(table_entries_by_teams, games_data[i][:team2])
      
      if index >= 0
        team_data = table_entries_by_teams[index]
        computes_team2_results(games_data, team_data, i)
      else
        team_data.store(:team, games_data[i][:team2])
        computes_team2_results(games_data, team_data, i)
        table_entries_by_teams.push(team_data)
      end
    end

    table_entries_by_teams
  end

  # Computes results for that team when in team2 place, ocasion where the :result value is the oposite
  def self.computes_team2_results(games_data, team_data, index)
    team_data.store(:mp, team_data[:mp] + 1) 

    if team_data[:team] == games_data[index][:team2]
      case games_data[index][:result]
        when 'win'
          team_data.store(:l, team_data[:l] + 1)
        when 'draw'
          team_data.store(:d, team_data[:d] + 1)
          team_data.store(:p, team_data[:p] + DRAW_POINTS)
        when 'loss'
          team_data.store(:w, team_data[:w]  + 1)
          team_data.store(:p, team_data[:p] + WIN_POINTS)
        else 
          'something went wrong' 
      end 
    end 
  end 

  # Computes results for that team when in team1 place, ocasion where the :result value refers to
  def self.computes_team1_results(games_data, team_data, index )
    # updates the number of matches played
    team_data.store(:mp, team_data[:mp] + 1)
   
    # if in team1 position, the result belongs to that team.
    if team_data[:team] == games_data[index][:team1]
      case games_data[index][:result]
        when 'win'
          team_data.store(:w, team_data[:w] + 1)
          team_data.store(:p, team_data[:p] + WIN_POINTS)
        when 'draw'
          team_data.store(:d, team_data[:d] + 1)
          team_data.store(:p, team_data[:p] + DRAW_POINTS)
        when 'loss'
          team_data.store(:l, team_data[:l]  + 1)
        else 
          'something went wrong' 
      end 
    end 
  end

  #Checks if the team is already in the list of teams and their results, return its index on that list
  def self.team_exists (list, team)
    exists = -1
    
    list.each_with_index do |i, index|
      if i[:team] == team
        exists = index
      end
    end 

    exists
  end 
    
  #Gets a long string of data.
  #Separates each game into its own array.
  #Creates an array of hashes containing [team1], [team2], and [result] keys for each game.
  #example:
  #[{:team1=>"Allegoric Alaskans", :team2=>"Blithering Badgers", :result=>"win"} 
  #{:team1=>"Blithering Badgers", :team2=>"Courageous Californians", :result=>"win"}]
  def self.categorize_data_by_games(input)
    games = input.split("\n")
    game = []
    games.each_index do |i|
      game[i] = games[i].strip.split(";")
    end

    games_data = []
    games.each_index do |i|
      data = {}
    
      data.merge!(team1: game[i][0])
      data.merge!(team2: game[i][1])
      data.merge!(result: game[i][2])

      games_data.push(data)
    end

    games_data 
  end
end