# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'tournoi_interne.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|

  pl = Player.new
  puts pl
  pl.first_name = row["Prenom"]
  pl.last_name = row["Nom"]
  pl.ranking = row["classement"]
  gp = Group.where(name: row["Poule"])
  if gp
    pl.group_id = gp[0].id
  end
  pl.save
  puts "#{pl.first_name} #{pl.last_name} saved"

end
