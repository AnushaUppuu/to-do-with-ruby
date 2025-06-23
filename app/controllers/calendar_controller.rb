class CalendarController < ApplicationController
  before_action :authenticate_user!

  def index
    @years = Task.where(user: current_user).pluck("DISTINCT EXTRACT(YEAR FROM created_at)").map(&:to_i).uniq
  end

  def year
    @year = params[:year].to_i
    @months_with_tasks = Task.where(user: current_user)
                             .where("EXTRACT(YEAR FROM created_at) = ?", @year)
                             .pluck(Arel.sql("DISTINCT EXTRACT(MONTH FROM created_at)"))
                             .map(&:to_i)
                             .uniq
  end
  

  def month
    @year = params[:year].to_i
    @month = params[:month].to_i
  
    @days_with_tasks = Task.where(user: current_user)
                           .where("EXTRACT(YEAR FROM created_at) = ? AND EXTRACT(MONTH FROM created_at) = ?", @year, @month)
                           .pluck(Arel.sql("EXTRACT(DAY FROM created_at)")).map(&:to_i)
  
    @first_day = Date.new(@year, @month)
    @last_day = @first_day.end_of_month
  end
  

  def day
    @year = params[:year].to_i
    @month = params[:month].to_i
    @day = params[:day].to_i
    @tasks = Task.where(user: current_user).where("DATE(created_at) = ?", Date.new(@year, @month, @day))
  end
end
