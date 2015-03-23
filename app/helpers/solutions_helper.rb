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

  def render_solution_title(solution)
    solution.title
  end
  def render_solution_edit_link(solution, user)
    if solution.user == user
      link_to("Edit", edit_problem_solution_path(solution.problem_id, solution), :class => "underline")
    end
  end

  def render_agree_level(comment)
    case comment.agree_level
    when "agree"
      content_tag(:span, "Agree", :class => "label label-success")
    when "object"
      content_tag(:span, "Object", :class => "label label-warning")
    when "against"
      content_tag(:span, "Against", :class => "label label-danger")
    else
    end
  end

  def render_agree_text(text)
    case text
    when "agree"
      "<i class='fa fa-thumbs-up'></i> Agree".html_safe
    when "object"
      "<i class='fa fa-thumbs-down'></i> Object".html_safe  
    when "against"
      "<i class='fa fa-times'></i> Against".html_safe
    end 
  end


end
