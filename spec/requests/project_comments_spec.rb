require 'rails_helper'

RSpec.describe "ProjectComments", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/project_comments/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/project_comments/index"
      expect(response).to have_http_status(:success)
    end
  end

end
