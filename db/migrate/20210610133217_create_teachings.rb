class CreateTeachings < ActiveRecord::Migration[6.1]
  def change
    create_table :teachings do |t|
      t.date :starting_date
      t.references :user, null: false, foreign_key: true
      t.references :workshop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
