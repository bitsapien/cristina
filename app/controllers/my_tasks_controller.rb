class MyTasksController < ApplicationController
  before_action :set_my_task, only: [:show, :edit, :update, :destroy]

  # GET /my_tasks
  # GET /my_tasks.json
  def index
    @my_tasks = MyTask.all
  end

  # GET /my_tasks/1
  # GET /my_tasks/1.json
  def show
  end

  # GET /my_tasks/new
  def new
    @my_task = MyTask.new
  end

  # GET /my_tasks/1/edit
  def edit
  end

  # POST /my_tasks
  # POST /my_tasks.json
  def create
    @my_task = MyTask.new(my_task_params)

    respond_to do |format|
      if @my_task.save
        format.html { redirect_to @my_task, notice: 'My task was successfully created.' }
        format.json { render :show, status: :created, location: @my_task }
      else
        format.html { render :new }
        format.json { render json: @my_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_tasks/1
  # PATCH/PUT /my_tasks/1.json
  def update
    respond_to do |format|
      if @my_task.update(my_task_params)
        format.html { redirect_to @my_task, notice: 'My task was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_task }
      else
        format.html { render :edit }
        format.json { render json: @my_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_tasks/1
  # DELETE /my_tasks/1.json
  def destroy
    @my_task.destroy
    respond_to do |format|
      format.html { redirect_to my_tasks_url, notice: 'My task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_task
      @my_task = MyTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_task_params
      params.require(:my_task).permit(:title, :description, :status, :deadline, :conversations_id)
    end
end
