class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :current_student, except: [:index, :show, :new, :create]
  # before_action :is_admin, except: [:index, :show, :edit, :update, :create]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    puts "HIIIIIIIIIIII"
    puts @students
  end

  def education
    @student = Student.find(@current_student.id)
    render "/students/education"
  end

  def search
    @students = Student.where(course_id: params[:id])
    puts "STUDEENTS: #{@students}"

    respond_to do |format|
      format.json { render :json => @students, :include => [:projects, :languages] }
    end
  end

  def profile
    current_url = request.original_url
    split = current_url.split("=")
    @student = Student.where(link: split.last).take
    render :profile
  end

  def profile_pic
    @student = Student.find(@current_student.id)
    render "/students/profile_pic"
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @student.admin = false;

    first_name = @student.first_name
    last_last = @student.last_name
    @student.link = (first_name + last_name).downcase

    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update

    uploaded_file = params[:student][:profile_pic_url].path
    cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
    params[:student][:profile_pic_url] = cloudinary_file["url"]

    puts params.inspect
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
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
      params.require(:student).permit(:first_name, :last_name, :email, :password, :linkedin, :github, :website, :contact, :description, :event_id, :school, :qualification, :degree, :graduation, :profile_pic_url, :course_id, :project_ids => [], :language_ids => [])
    end
end
