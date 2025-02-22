class Project < ApplicationRecord
  has_many :project_comments, dependent: :destroy
  has_many :project_status_changes, dependent: :destroy
  has_many :project_events, dependent: :destroy
  has_one :last_activity, -> { order(created_at: :desc) }, class_name: "ProjectEvent"

  enum :status, { pending: "Pending", in_progress: "In Progress", completed: "Completed", archived: "Archived", created: "created" }, default: :pending, validate: true

  after_update :register_status_change, if: :saved_change_to_status?
  after_create :register_status_change

  def histories
    project_events.order(created_at: :desc)
  end

  private

    def register_status_change
      raise ActiveRecord::Rollback unless Current.user

      project_status_changes.create!(status: status, user: Current.user)
    end
end
