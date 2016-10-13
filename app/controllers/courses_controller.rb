class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :is_admin

  def index
    @courses = Course.all
    @course = Course.new
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create

    # there are two ways to achieve the file upload here
    # first way is to, modify the params then initialize the object with these modified params
    # second way is to, initialize the object first then change the the value of picture_url
    # before saving into the database
    # the first method is executed here

    uploaded_file = params[:course][:picture_url].path
    cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
    puts "photo hereeeeee"
    puts params.inspect
    params[:course][:picture_url] = cloudinary_file["url"]
    # remove the line above, include the next line and move the initilization of course
    # object before executing the file upload onto cloudinary
    # @course.picture_url = cloudinary_file["url"]

    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_url, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update


    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_url, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :picture_url)
    end
end
