class TasksController < ApplicationController
  before_action :authenticate_user!

  def calendar
    @years = current_user.tasks.pluck(:created_at).map(&:year).uniq
  end

  def year
    @year = params[:year].to_i
    @months = current_user.tasks.where("extract(year from created_at) = ?", @year)
                                .pluck(:created_at).map(&:month).uniq
  end

  def month
    @year = params[:year].to_i
    @month = params[:month].to_i
    @tasks = current_user.tasks.where("extract(year from created_at) = ? AND extract(month from created_at) = ?", @year, @month)
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to calendar_path, notice: "Task created!"
    else
      render :new
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to calendar_path, notice: "Task deleted."
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end
