
module AsksHelper

  def ask_author(ask)
    user_signed_in? && current_user.id == ask.user_id
  end

  def reply_author(reply)
    user_signed_in? && current_user.id == reply.user_id
  end

end