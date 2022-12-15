class TasksController < ApplicationController
  def index_open_tasks
    @tasks = Task.all
  end

  def task
    @task = Task.all
  end
end
