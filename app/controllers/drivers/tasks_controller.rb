# app/controllers/drivers/tasks_controller.rb
class Drivers::TasksController < ApplicationController
  before_action :authenticate_driver!
  before_action :set_task, only: [ :show, :update ]

  def index
    @tasks = current_driver.tasks
  end

  def show
  end

  def update
    if @task.update(task_params)
      redirect_to drivers_task_path(@task), notice: "Task was successfully updated."
    else
      render :show
    end
  end

  private

  def set_task
    @task = current_driver.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:completed)
  end

  def toggle_completion
    @task = Task.find(params[:id])
    @task.update(completed: !@task.completed)
    redirect_to drivers_dashboard_path, notice: "Task status updated."
  end
end
