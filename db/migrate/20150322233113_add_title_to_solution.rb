class AddTitleToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :title , :string
    add_column :problems, :solutions_count, :integer, :default => 0
  end
end
