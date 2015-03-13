class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.text :description
      t.text :causes
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
