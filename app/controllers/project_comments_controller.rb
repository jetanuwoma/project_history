class ProjectCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
     @project_comment = @project.project_comments.new(project_comment_params)
     @project_comment.user = Current.user

    if @project_comment.save
      redirect_to @project, notice: "Comment added successfully"
    else
      redirect_to @project, alert: "Comment creation failed"
    end
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def project_comment_params
      params.require(:project_comment).permit(:content)
    end
end
