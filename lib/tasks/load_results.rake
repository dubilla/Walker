desc "Load tournament results"
task :load_results, [:tournament_id, :environment] => [:environment] do |task, args|
  tournament_id = args[:tournament_id]
  tournament = Tournament.find_by_external_id(tournament_id)
  cut_scores = ["CUT", "WD", "DQ"]

  url = "http://www.espn.com/golf/leaderboard?tournamentId=#{tournament_id}"
  html = open(url)
  doc = Nokogiri::HTML(html)
  golfers = []
  table = doc.at(".competitors .Table2__tbody")
  table.search(".Table2__tr").each do |tr|
    cells = tr.search("td")
    golfers.push(
      name: cells[1].text,
      score: (!cut_scores.include? cells[2].text) ? cells[2].text : nil,
      cut: (cut_scores.include? cells[2].text)
    )
  end
  golfers.each do |g|
    competitor = tournament.competitors.find_by_name(g[:name])
    if competitor.present?
      competitor.update_attributes(score: g[:score])
    else
      tournament.competitors.create(name: g[:name], score: g[:score])
    end
  end
end
