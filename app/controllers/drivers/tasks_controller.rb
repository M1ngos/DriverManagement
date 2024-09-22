class Drivers::TasksController < ApplicationController
  before_action :authenticate_driver!
  before_action :set_task, only: [ :show, :update, :toggle_completion ]

  def index
    start_of_day = Time.zone.now.beginning_of_day
    end_of_day = Time.zone.now.end_of_day

    @tasks = current_driver.tasks.where(created_at: start_of_day..end_of_day)
  end


  def new
    @task = Task.new
  end

  def show
  end


  def create
    @task = current_driver.tasks.build(task_params) # Associate task with current driver
    if @task.save
       # redirect_to drivers_task_path(@task), notice: "Task was successfully created."
       redirect_to driver_dashboard_path(@task), notice: "Task was successfully created."
    else
      render :new
    end
  end


  def update
    if @task.update(task_params)
      redirect_to drivers_task_path(@task), notice: "Task was successfully updated."
    else
      render :show
    end
  end

  def toggle_completion
    @task = Task.find(params[:id])
    @task.update(completed: !@task.completed)
    redirect_to driver_dashboard_path, notice: "Task status updated."
  end

  private

  def set_task
    @task = current_driver.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description) # Allow completed if needed
  end
end
