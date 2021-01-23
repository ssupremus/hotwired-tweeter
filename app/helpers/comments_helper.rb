# frozen_string_literal: true

# comments helper
module CommentsHelper
  def linked_users(body)
    body.gsub(/@(\w+)/) do |match|
      link_to match, user_path(Regexp.last_match(1)), data: { turbo_frame: :_top }
    end.html_safe
  end
end
