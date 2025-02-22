module ProjectsHelper
  def status_color(status)
    case status
    when "pending" then "bg-yellow-100 text-yellow-800"
    when "in_progress" then "bg-blue-100 text-blue-800"
    when "completed" then "bg-green-100 text-green-800"
    when "archived" then "bg-gray-100 text-gray-800"
    end
  end
end
