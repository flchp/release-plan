class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :title, :limit => 50, :default => "" 
      t.text :content
      t.references :commentable, :polymorphic => true
      t.references :user
      t.string :role, :default => "comments"
      t.timestamps
    end

    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
    add_index :comments, :user_id

    add_column :problems, :comments_count, :integer, :default => 0
    add_column :solutions, :comments_count, :integer, :default => 0
  end

  def self.down
    drop_table :comments
  end
end
