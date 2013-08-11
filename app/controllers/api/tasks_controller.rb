class Api::TasksController < Api::BaseController
  def index
    respond_with :api, Task.all
  end
 
  def show
    respond_with :api, Task.find(params[:id])
  end
 
  def create
    respond_with :api, Task.create(params[:task].permit(:title, :description))
  end
 
  def update
    respond_with :api, Task.update(params[:id], params[:task].permit(:title, :description))
  end
 
  def destroy
    respond_with :api, Task.destroy(params[:id].permit(:title, :description))
  end
end