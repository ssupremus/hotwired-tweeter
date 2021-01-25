# frozen_string_literal: true

json.array! @notifications do |notification|
  json.id notification.id
  json.recipient notification.recipient.username
  json.user notification.user.username
  json.action notification.action
  json.notifiable do
    json.type notification.notifiable.class.to_s.underscore.humanize.downcase
  end
end
