class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    # not using a variable in a view so no need to use @ symbol
    # using the (filtered) strong params to create the new restaurant
    task = Task.create(task_params)
    # redirecting to the show view of the restaurant
    redirect_to task_path(task)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

private

  def task_params
    return params.require(:task).permit(:title, :details, :completed)
  end
end


# As a user, I can list tasks
# As a user, I can view the details of a task
# As a user, I can add a new task
# As a user, I can edit a task (mark as completed / update title & details)
# As a user, I can remove a task
