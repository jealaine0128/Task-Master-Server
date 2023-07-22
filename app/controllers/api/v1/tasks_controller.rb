class Api::V1::TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /api/v1/tasks
  def index
    tasks = current_user.tasks
    render json: tasks
  end

  # GET /api/v1/tasks/:id
  def show
    render json: @task
  end

  # POST /api/v1/tasks
  def create
    task = current_user.tasks.build(task_params)
    task.user_id = current_user.id # Explicitly set the user_id
  
    if task.save
      render json: task, status: :created
    else
      render json: { errors: task.errors }, status: :unprocessable_entity
    end
  end

  # PATCH /api/v1/tasks/:id
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tasks/:id
  def destroy
    @task.destroy
    render json: { message: 'Task deleted successfully' }
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :deadline, :category_id, :completed)
  end
end
