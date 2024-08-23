class TasksController < ApplicationController
  def index
    @task_items = Task.all
  end

  def show
    @task_item  = Task.find(params[:id])
  end

  def new
    @new_task = Task.new
  end

  def create
    @new_task = Task.new(task_access)
    # raise
    @new_task.save
  end

  def edit
    @new_task = Task.new(params[:id])
  end

  def update
    @updated_task = Task.find(params[:id])
    @updated_task.update(task_access)

    redirect_to tasks_path(@updated_task)
  end

  private

  def task_access
    params.require(:task).permit(:title, :details, :completed)
  end
end
