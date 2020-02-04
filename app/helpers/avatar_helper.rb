module AvatarHelper
  def avatar(user)
    user_digest = Digest::MD5::hexdigest(user.email)
    gurl = "// gravatar.com/avatar/#{user_digest}"
    image_tag gurl
  end
end
