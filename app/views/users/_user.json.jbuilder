# frozen_string_literal: true

json.extract! user, :id, :username

json.sgid user.attachable_sgid
json.content render(partial: 'users/user', locals: { user: user }, formats: [:html])
