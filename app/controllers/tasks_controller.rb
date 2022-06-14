class TasksController < ApplicationController
  before_action :set_task, except: %i[index create complete]

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.user = current_user
    task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def complete
    @task = Task.find(params[:task_id])
    @task.completed = !@task.completed
    @task.save
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
