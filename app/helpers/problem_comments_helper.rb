module ProblemCommentsHelper

  def render_comment_content(comment)
    comment.content.to_markdown
  end
end
