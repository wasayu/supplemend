class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.references :user, foreign_key: true
      t.references :supplement, foreign_key: true
      t.string :content
      t.integer :daily
      t.date :start_day
      t.date :end_day

      t.timestamps
    end
  end
end
