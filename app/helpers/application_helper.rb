# frozen_string_literal: true

# application helper
module ApplicationHelper
  def nav_link_class(scope)
    if request.path == "/#{scope}" || request.path == '/' && scope == 'tweets'
      'bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium'
    else
      'text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium'
    end
  end
end
