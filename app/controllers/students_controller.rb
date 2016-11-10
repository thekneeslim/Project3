class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :current_student, except: [:index, :show, :new, :create, :students_all, :search, :profile]


  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  def students_all
    @students = Student.all
  end

  def education
    @student = Student.find(current_student.id)
    render "/students/education"
  end

  def search
    @students = Student.where(course_id: params[:id], status: 2)

    respond_to do |format|
      format.json { render :json => @students, :include => [:projects, :languages, :works] }
    end
  end

  # def profile
  #   current_url = request.original_url
  #   split = current_url.split("=")
  #   @student = Student.where(link: split.last).take
  #   render :profile
  # end

  def profile_pic
    @student = Student.find(current_student.id)
    render "/students/profile_pic"
  end

  def show
    @student = Student.find(current_student.id)
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.admin = false;
    @student.status = 0;

    first_name = @student.first_name
    last_name = @student.last_name
    @student.link = (first_name + last_name).downcase

    if @student.save
      # this line is necessary to allow student to be directly logged in
      # after signed up
      session[:student_id] = @student.id
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def update
    # this checks if a upload file exist
    # if true, upload on to cloudinary and update
    # note that we are modifying the params here before updating the student object
    if params[:student][:profile_pic_url].present?
      uploaded_file = params[:student][:profile_pic_url].path
      cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
      params[:student][:profile_pic_url] = cloudinary_file["url"]

      puts params.inspect
      if @student.update(student_params)
        redirect_to @student, notice: 'Student was successfully updated.'
      else
        render :edit
      end

    # else just update
    else
      if @student.update(student_params)
        if current_student.admin
          redirect_to students_all_url, notice: 'Student was successfully updated.'
        else
          redirect_to @student, notice: 'Student was successfully updated.'
        end
      else
        render :edit
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :password, :linkedin, :github, :website, :contact, :description, :event_id, :school, :qualification, :degree, :graduation, :profile_pic_url, :course_id, :one_liner, :link, :video, :status, :project_ids => [], :language_ids => [])
    end
end
