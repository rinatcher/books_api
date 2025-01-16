class CreateReadingStatuses < ActiveRecord::Migration[7.2]
  def change
    create_table :reading_statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :isbn
      t.string :status, default: 'not read'

      t.timestamps
    end
  end
end
