class StudentCoursesController < ApplicationController
  def create
    @student = current_user
    @course = Course.find(params[:course_id])
    if @student.courses << @course
      flash[:success] = "Successfully enrolled in the course."
    else
      flash[:error] = "Failed to enroll in the course."
    end
    redirect_to @student
  end

  def destroy
    @student = current_user
    @course = Course.find(params[:id])
    @student.courses.delete(@course)
    flash[:success] = "Successfully unenrolled from the course."
    redirect_to @course
  end
end
