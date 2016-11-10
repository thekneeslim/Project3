class MainController < ApplicationController

  def index

  end

  def browse
    @events = Event.all
    @courses = Course.all
    render :browse
  end

  def profile
    student_id = params[:graduate]
    @student = Student.find(student_id)
    puts "#{@student}"
    render :profile
  end

  def landing
    render layout: false
  end

  def instructions
    render "/main/instructions"
  end

  def admin

  end

end
