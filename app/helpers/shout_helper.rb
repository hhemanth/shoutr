module ShoutHelper
  def avatar(user)
    user_digest = Digest::MD5::hexdigest(user.email)
    gurl = "// gravatar.com/avatar/#{user_digest}"
    image_tag gurl
  end

  def like_button(shout)
    if(current_user.liked?(shout))
      link_to "Un Like", unlike_shout_path(shout), method: :delete
    else
      link_to "Like", like_shout_path(shout), method: :post
    end
  end
end