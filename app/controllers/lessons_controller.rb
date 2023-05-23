class LessonsController < ApplicationController
  before_action :set_classroom
  before_action :set_lesson, only: %i[ show edit update destroy ]

  # GET /classrooms/:classroom_id/lessons or /classrooms/:classroom_id/lessons.json
  def index
    @lessons = @classroom.lessons.all
  end

  # GET /classrooms/:classroom_id/lessons/1 or /classrooms/:classroom_id/lessons/1.json
  def show
  end

  # GET /classrooms/:classroom_id/lessons/new
  def new
    @lesson = @classroom.lessons.build
    @classroom.students.each do |student|
      rel = @lesson.student_lessons.build
      rel.student = student
    end
  end

  # GET /classrooms/:classroom_id/lessons/1/edit
  def edit
  end

  # POST /classrooms/:classroom_id/lessons or /classrooms/:classroom_id/lessons.json
  def create
    @lesson = @classroom.lessons.build(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to classroom_lesson_path(@classroom, @lesson), notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classrooms/:classroom_id/lessons/1 or /classrooms/:classroom_id/lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to classroom_lesson_path(@classroom, @lesson), notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/:classroom_id/lessons/1 or /classrooms/:classroom_id/lessons/1.json
  def destroy
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to classroom_path(@classroom), notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:classroom_id])
    end
    def set_lesson
      @lesson = @classroom.lessons.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(
        :title, :description, :homework, :homework_link, :classroom_id,
        student_lessons_attributes: [ 
          :lesson_id, :student_id, 
          :abstract, :absent,
          :RC, :CP, :AG, :CM, :AP, :MV, :id
         ]
      )
    end
end
