module SolutionsHelper

  def render_solution_content(solution)
    solution.content.to_markdown
  end


  def render_solution_created_at(solution)
    solution.created_at.to_s(:short)
  end

  def render_user_company(user)
    user.company
  end

  def render_solution_edit_link(solution, user)
    if solution.user == user
      link_to("Edit", edit_problem_solution_path(solution, user), :class => "underline")
    end
  end
end
