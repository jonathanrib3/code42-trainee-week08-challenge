# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student, only: %i[edit update destroy]
  before_action :set_year, only: %i[index show]

  def index
    @students = Student.find_all_students_enrolled_on_year(@year)
    render :index, status: :ok
  end

  def show
    @student = Student.find_student_by_id_enrolled_on_year(year: @year, id: params[:id]).first
    if @student.nil?
      render :not_enrolled, status: :not_found
    else
      @enrollment_code =
        @student.enrollments.find { |enrollment| enrollment.course.year == @year }.code
      @averages = Student.find_student_grades_averages_by_id(params[:id])
      render :show, status: :ok
    end
  end

  def new
    @student = Student.new
  end

  def edit; end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student, notice: I18n.t('flash.student.success.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: I18n.t('flash.student.success.update'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: I18n.t('flash.student.success.destroy'), status: :see_other
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def set_year
    @year = params.key?(:year) ? params[:year].to_i : 2023
  end

  def student_params
    params.require(:student).permit(:name, :born_on)
  end
end
