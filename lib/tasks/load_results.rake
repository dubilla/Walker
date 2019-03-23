desc "Load tournament results"
task :load_results, [:tournament_id, :environment] => [:environment] do |task, args|
  tournament_id = args[:tournament_id]
  tournament = Tournament.find_by_external_id(tournament_id)
  cut_scores = ["CUT", "WD", "DQ"]
  golfers = []

  url = "http://www.espn.com/golf/leaderboard?tournamentId=#{tournament_id}"
  html = open(url)
  doc = Nokogiri::HTML(html)

  status = doc.at(".status").text
  table = doc.at(".competitors .Table2__tbody")

  if status == "Final"
    table.search(".Table2__tr").each do |tr|
      cells = tr.search("td")
      golfers.push(
        name: cells[1].text,
        score: (!cut_scores.include? cells[2].text) ? cells[2].text : nil,
        cut: (cut_scores.include? cells[2].text)
      )
    end
  else
    table.search(".Table2__tr:not(.cutline)").each do |tr|
      cells = tr.search("td")
      golfers.push(
        name: cells[2].text,
        score: (!cut_scores.include? cells[3].text) ? cells[3].text : nil,
        cut: (cut_scores.include? cells[3].text)
      )
    end
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
