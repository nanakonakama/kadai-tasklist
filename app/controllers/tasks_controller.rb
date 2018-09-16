class TasksController < ApplicationController
	
	
	before_action :set_task, only: [:show, :edit, :update, :destroy]
	
	def set_task
		@task=Task.find(params[:id])
	end
	def index
		@tasks = Task.all
	end
	
	def show
	end
	
	def new
		@task = Task.new
	end
	
	def create
		@task = Task.new(task_params)
		if @task.save
			flash[:succuess] = 'Task が正常に投稿されました'
			redirect_to @task
		else
			flash.now[:danger] = 'Taskが正常に投稿されませんでした'
			render :new
		end
				
	end
	
	def edit
	end
	
	def update
		
		if @task.update(task_params)
			flash[:succuess] = 'Taskは正常に投稿されました。'
			redirect_to @task
		else
			flash.now[:danger] = 'Taskは正常に投稿されませんでした。'
			render :edit
		end
	end
	
	def destroy
		@task.destroy
		
		flash[:succuess] ='Taskは正常に削除されました。'
		redirect_to tasks_url
	end

private

def task_params
	params.require(:task).permit(:content)
end

end	