class ProjectStatusChange < ApplicationRecord
  belongs_to :project
  belongs_to :user

  after_create :create_project_event

  private
    def create_project_event
      project.project_events.create!(
        user: user,
        eventable: self,
        event_type: :status_change,
        data: { from: project.status, to: status }
      )
    end
end
