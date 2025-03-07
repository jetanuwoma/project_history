class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [ :show, :update ]

  def index
    @projects = Project.includes(:last_activity).order(created_at: :desc)
    @project = @project.where(status: params[:status]) if params[:status].present?
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: "Project created successfully"
    else
      render :new, alert: "Project creation failed"
    end
  end

  def update
     @project.update(project_params)

     respond_to do |format|
       format.html { redirect_to @project }
       format.turbo_stream
     end
  end

  private
    def project_params
      params.require(:project).permit(:name, :status)
    end

    def set_project
      @project = Project.includes(project_events: :user).find(params[:id])
    end
end
