class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :current_student, except: [:index, :show]
  before_action :is_admin, only: [:projects_all]

  # GET /projects
  # GET /projects.json
  def index
    # if current_student.admin == true
    #   @projects = Project.all
    # else

    @student = Student.find(current_student.id)
    # end
    @project = Project.new
  end

  def projects_all
      @projects = Project.all
  end

  def nicetry
    render "/main/nicetry"
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    # creating a new project with the params passed from form to controller
    # then pushing this new project into the array of projects by current student
    # note that this is a has and belongs to many relationship
    @project = Project.create(project_params)
    @current_student.projects.push(@project)

    if @current_student.save
      redirect_to projects_path, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    if @project.update(project_params)
      if @current_student.admin
        redirect_to projects_all_url
      else
        redirect_to projects_url, notice: 'Project was successfully updated.'
      end
    else
      render :edit
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    if @current_student.admin
      redirect_to projects_all_url
    else
      redirect_to projects_url, notice: 'Project was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :github, :site, :description, :project_gifs)
    end
end
