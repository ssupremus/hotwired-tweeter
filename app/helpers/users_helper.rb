# frozen_string_literal: true

# users helper
module UsersHelper
  def unsubscribed?
    current_user.subscriptions
                .where(followee_id: @user.id)
                .none?
  end
end
