class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :content
      t.integer :user_id
      t.integer :problem_id
      t.timestamps null: false
    end
  end
end
