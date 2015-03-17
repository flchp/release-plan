module ProblemsHelper

  def render_problem_author(problem)
    problem.user.email
  end

  def render_problem_title(problem)
    link_to(problem.title, problem_path(problem))
  end


  def render_problem_description(problem)
    problem.description.to_markdown
  end
end
