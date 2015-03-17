module ApplicationHelper

  
  def avatar_icon(user, options = { :size => 100})
    gravatar_image_tag(user.email, :class => "thumb #{options[:class]}", :alt => user.name , :gravatar => { :size => options[:size] ,  :default => :wavatar })
  end
  

  def render_user_avatar(user, size = :small)
    width = case size
    when :tiny
      20
    else
      60
    end
    avatar_icon(user, :class => "img-circle", :size => width)
  end


  def render_user_name(user)
    user.name
  end  
end
