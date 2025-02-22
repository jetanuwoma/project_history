class ProjectComment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :parent, class_name: "ProjectComment", optional: true

  has_many :replies, class_name: "ProjectComment", foreign_key: :parent_id, dependent: :destroy

  validates :content, presence: true

  scope :root_comments, -> { where(parent_id: nil) }

  after_create :create_project_event

  private

    def create_project_event
      project.project_events.create!(user: user, eventable: self, event_type: :comment_added, data: { content: content })
    end

end
