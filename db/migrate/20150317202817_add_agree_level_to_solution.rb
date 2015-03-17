class AddAgreeLevelToSolution < ActiveRecord::Migration
  def change
    add_column :comments, :agree_level, :integer
  end
end
