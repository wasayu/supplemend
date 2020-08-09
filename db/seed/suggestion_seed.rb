require 'csv'

CSV.foreach('db/csv/提案.csv') do |row|
  Suggestion.create(
    :content => row[0],
    :purpose => row[1],
    :budget => row[2],
    :protein_flavor => row[3],
    :amino_flavor => row[4]
  )
end