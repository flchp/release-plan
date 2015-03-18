module SolutionCommentsHelper

  def render_comment_edit_link(comment, user)
    if comment.user == user
      link_to("Edit", edit_comment_path(comment), :class => "underline")
    end
  end

end
