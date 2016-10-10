class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_student
  puts "Current student: #{@current_student}"

  def is_authenticated
    unless current_student
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  def is_admin
    unless current_student.admin
      flash[:danger] = "Credentials Invalid!! Admin access only!"
      redirect_to login_path
    end
  end

  def current_student
    @current_student ||= Student.find_by_id(session[:student_id])
  end

end
