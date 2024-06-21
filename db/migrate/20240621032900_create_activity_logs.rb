class CreateActivityLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_logs do |t|
      t.references :activity_type, null: false, foreign_key: true
      t.date :date
      t.string :duration
      t.text :notes

      t.timestamps
    end
  end
end
