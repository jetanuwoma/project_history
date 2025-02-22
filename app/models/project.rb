class Project < ApplicationRecord
  has_many :project_comments, dependent: :destroy
  has_many :project_events, dependent: :destroy
  has_one :last_activity, -> { order(created_at: :desc) }, class_name: "ProjectEvent"

  enum :status, { pending: "Pending", in_progress: "In Progress", completed: "Completed", archived: "Archived" }, default: :pending, validate: true
end
