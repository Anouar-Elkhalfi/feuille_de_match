# db/seeds.rb

# 1. Clean the database 🗑️
puts "Cleaning database..."
Match.destroy_all
MatchParticipation.destroy_all
YellowCard.destroy_all
RedCard.destroy_all
Injury.destroy_all
Player.destroy_all
Referee.destroy_all
Division.destroy_all
Championship.destroy_all
Season.destroy_all
Club.destroy_all

# 2. Create Seasons
puts "Creating seasons..."
season = Season.create!(name: "2024-2025")
puts "Created season #{season.name}"

# 3. Create Championship
puts "Creating championships..."
championship = Championship.create!(name: "Dimanche", season: season)
puts "Created championship #{championship.name}"

# 4. Create Divisions
puts "Creating divisions..."
division = Division.create!(name: "1ère division Elite", championship: championship)
puts "Created division #{division.name}"

# 5. Create Clubs
puts "Creating clubs..."
club1 = Club.create!(name: "FC Atlas")
club2 = Club.create!(name: "US Casablanca")
puts "Created clubs #{club1.name} and #{club2.name}"

# 6. Create Referees
puts "Creating referees..."
referee = Referee.create!(first_name: "Ali", last_name: "Benali", license_number: "REF123")
puts "Created referee #{referee.first_name} #{referee.last_name}"

# 7. Create Matches
puts "Creating matches..."
Match.create!(
  date: Date.today,
  kickoff_time: Time.now,
  stadium: "Stade Municipal",
  home_club: club1,
  away_club: club2,
  referee: referee,
  division: division,
  home_score: 2,
  away_score: 1
)
puts "Created match FC Atlas vs US Casablanca"

# 8. Display a message 🎉
puts "Finished! Created #{Match.count} matches."
