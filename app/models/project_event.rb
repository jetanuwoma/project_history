class ProjectEvent < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :eventable, polymorphic: true

  enum :event_type, {
    comment_added: "comment_added",
    status_changed: "status_changed"
  }

  validates :event_type, presence: true

  def old_status
    data["from"]
  end

  def new_status
    data["to"]
  end

  def content
    data["content"]
  end
end
