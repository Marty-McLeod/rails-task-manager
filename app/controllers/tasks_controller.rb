class TasksController < ApplicationController
  # Use a callback to reduce duplicated code for model record reads (a.k.a, from DB w/ task ID)
  before_action :get_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    @task
  end

  def new
    @task = Task.new # Instantiate form with empty model task object
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task.id)
  end

  def edit
    @task
  end


  def update
    # @updated_task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path(@task.id)
  end

  def destroy
    # @del_task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path, status: :see_other
  end


  private

  def get_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end

