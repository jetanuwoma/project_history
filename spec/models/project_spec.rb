require 'rails_helper'


RSpec.describe Project, type: :model do
  let(:user) { create(:user) }
  let(:project) { create(:project, status: "pending") }
  let(:comment) { create(:project_comment, content: "my comment", project:, user:) }

  before do
    Current.user = user
  end

  describe "Callbacks" do
    it "registers a status change when updated" do
      expect {
        project.update!(status: "in_progress")
      }.to change(ProjectStatusChange, :count).by(2).and change(ProjectEvent, :count).by(2)
    end
  end

  describe "Event Creation" do
    it "creates a ProjectEvent when status is changed" do
      expect {
        project.update!(status: "completed")
      }.to change { ProjectEvent.where(event_type: "status_changed").count }.by(2)
    end

    it "stores correct data in the event log" do
      project.update!(status: "in_progress")
      event = ProjectEvent.last

      expect(event.event_type).to eq("status_changed")
      expect(event.data["from"]).to eq("pending")
      expect(event.data["to"]).to eq("in_progress")
    end
  end

  describe "Current.user Tracking" do
    it "associates the correct user with status change events" do
      project.update!(status: "completed")
      event = ProjectEvent.last

      expect(event.user).to eq(user)
    end
  end
end
