# frozen_string_literal: true

module ApplicationHelper
  def flash_class(key)
    sym = key.to_sym
    case sym
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end
end
