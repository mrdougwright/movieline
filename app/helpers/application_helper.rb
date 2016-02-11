module ApplicationHelper
  def pretty_date(date)
    return nil if date.nil?
    date.strftime("%Y %b")
  end
end
