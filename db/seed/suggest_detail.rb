require 'csv'

CSV.foreach('db/csv/suggest_detail.csv') do |row|
  SuggestDetail.create(
    :supplement_id => row[0],
    :suggestion_id => row[1]
  )
end