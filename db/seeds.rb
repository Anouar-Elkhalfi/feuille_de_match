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
seasons = []
["2024-2025", "2025-2026"].each do |year|
  seasons << Season.create!(name: year)
end
puts "Created #{seasons.size} seasons"

# 3. Create Championships per season
puts "Creating championships..."
championships = []
seasons.each do |season|
  championships << Championship.create!(name: "Foot à 11 - Elite - #{season.name}", season: season)
  championships << Championship.create!(name: "Foot à 11 - Challenge - #{season.name}", season: season)
  championships << Championship.create!(name: "Foot à 7 - Elite - #{season.name}", season: season)
  championships << Championship.create!(name: "Foot à 7 - Challenge - #{season.name}", season: season)
end
puts "Created #{championships.size} championships"

# 4. Create Divisions per championship
puts "Creating divisions..."
divisions = []
championships.each do |championship|
  divisions << Division.create!(name: "Division A - #{championship.name}", championship: championship)
  divisions << Division.create!(name: "Division B - #{championship.name}", championship: championship)
end
puts "Created #{divisions.size} divisions"

# 5. Create 12 Clubs
puts "Creating clubs..."
clubs = []
(1..12).each do |i|
  clubs << Club.create!(name: "Club #{i}")
end
puts "Created #{clubs.size} clubs"

# 6. Create Referee
puts "Creating referee..."
referee = Referee.create!(first_name: "Ali", last_name: "Benali", license_number: "REF123")
puts "Created referee #{referee.first_name} #{referee.last_name}"

# 7. Create Matches per division
puts "Creating matches..."
divisions.each do |division|
  6.times do |index|
    home, away = clubs.sample(2)
    Match.create!(
      date: Date.today + rand(1..60).days,
      kickoff_time: Time.now.change(hour: rand(14..20), min: [0,30].sample),
      stadium: "Stade #{['Municipal', 'National', 'Olympique'].sample}",
      home_club: home,
      away_club: away,
      referee: referee,
      division: division,
      match_day: index + 1,
      home_score: rand(0..3),
      away_score: rand(0..3)
    )
  end
end

puts "Created #{Match.count} matches 🎉"
