require 'csv'

CSV.foreach('db/csv/suppl_tag_seed.csv') do |row|
  SupplTag.create(
    :supplement_id => row[0],
    :tag_id => row[1],
    :primary_tag => row[2]
  )
end