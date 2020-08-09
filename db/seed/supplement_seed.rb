require 'csv'

CSV.foreach('db/csv/ネイチャーメイド.csv') do |row|
  Supplement.create(
    :item_name => row[0],
    :brand => row[1],
    :suppl_name => row[2],
    :made => row[3],
    :flavor => row[4],
    :price => row[5],
    :price_tag => row[6],
    :use_time => row[7],
    :calorie => row[8],
    :lipid => row[9],
    :carbo => row[10],
    :protein => row[11],
    :img => row[12],
    :url => row[13]
  )
end