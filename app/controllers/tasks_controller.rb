class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.includes(:category).order(created_at: :desc)
  end

  def completed
    @tasks = current_user.tasks.complete.includes(:category).order(created_at: :desc)
    render :index
  end

  def show
  end

  def new
    @task = current_user.tasks.new
    @task.priority = false
    @task.completed = false
    @categories = Category.order(:name)  # Changed from current_user.categories
  end
  
  def edit
    @categories = Category.order(:name)  # Changed from current_user.categories
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to @task, notice: "Task was successfully created."
    else
      @categories = current_user.categories.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      @categories = current_user.categories.order(:name)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: "Task was successfully deleted."
  end

  private
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :completed, :priority, :category_id)
    end
    
    def redirect_back_or_to(default)
      if request.referer && request.referer != request.url
        redirect_to request.referer
      else
        redirect_to default
      end
    end
end