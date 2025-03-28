class StudentsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  before_action :require_same_student, only: [:edit, :update]

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "You have successfully signed up"
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      flash[:success] = "You have successfully updated your profile"
      redirect_to student_path(@student)
    else
      render "edit"
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def require_same_student
    if current_user != @student = Student.find(params[:id])
      redirect_to student_path(current_user)
    end
  end
end
