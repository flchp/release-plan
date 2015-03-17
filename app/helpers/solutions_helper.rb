module SolutionsHelper

  def render_solution_content(solution)
    solution.content
  end


  def render_solution_created_at(solution)
    solution.created_at.to_s(:short)
  end

end
