class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  # GET /works
  # GET /works.json
  def index
    # if current_student.admin == true
    #   @works = Work.all
    # else
      @student = Student.find(@current_student.id)
    # end
    @work = Work.new
  end

  # GET /works/1
  # GET /works/1.json
  def show
  end

  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(work_params)
    @work.student_id = @current_student.id

    if @work.save
      redirect_to works_url, notice: 'Work was successfully created.'
    else
      format.html { render :new }
    end

  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
      if @work.update(work_params)
        redirect_to works_url, notice: 'Work was successfully updated.'
      else
        format.html { render :edit }
      end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work.destroy
    redirect_to works_url, notice: 'Work was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:title, :start, :end, :description, :student_id, :company)
    end
end
