class ProjectStatusChange < ApplicationRecord
  belongs_to :project
  belongs_to :user

  after_create :create_project_event

  private
    def create_project_event
      old_status = project.project_status_changes.where("id < ?", id).last&.status || "created"
      project.project_events.create!(
        user: user,
        eventable: self,
        event_type: :status_changed,
        data: { from: old_status, to: status }
      )
    end
end
