class TasksController < ApplicationController

  before_action :set_task, only:[:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, :notice => "成功建立！"
    else
      render :action => :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to task_path(@task), :notice => "更新成功"
    else
      render :action => :edit
    end
  end

  def destroy
    if @task.can_destroy?
       @task.destroy
       redirect_to tasks_path, :notice => '成功刪除!!'
    else
      redirect_to tasks_path, :alert => '過期無法刪除！'
    end
  end


  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :note)
  end


end
