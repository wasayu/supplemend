require 'csv'

CSV.foreach('db/csv/supplementsテーブル.csv') do |row|
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

CSV.foreach('db/csv/suggestion_seed.csv') do |row|
  Suggestion.create(
    :content => row[0],
    :purpose => row[1],
    :budget => row[2]
  )
end

CSV.foreach('db/csv/suggest_detail_seed.csv') do |row|
  SuggestDetail.create(
    :supplement_id => row[0],
    :suggestion_id => row[1]
  )
end

Tag.create(content: 'ホエイプロテイン')
Tag.create(content: 'ソイプロテイン')
Tag.create(content: 'BCAA')
Tag.create(content: 'EAA')
Tag.create(content: 'クレアチン')
Tag.create(content: 'マルチビタミン')
Tag.create(content: 'HMB')

CSV.foreach('db/csv/suppl_tag_seed.csv') do |row|
  SupplTag.create(
    :supplement_id => row[0],
    :tag_id => row[1],
    :primary_tag => row[2]
  )
end