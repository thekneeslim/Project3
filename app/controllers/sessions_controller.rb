class SessionsController < ApplicationController

  def create
  student = Student.authenticate(student_params)

    if student
      session[:student_id] = student.id
      flash[:success] = "Student logged in!!"
      redirect_to root_path
    else
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:success] = "Student logged out!!"
    redirect_to root_path
  end

  private

  def student_params
    params.require(:student).permit(:email, :password)
  end
end
