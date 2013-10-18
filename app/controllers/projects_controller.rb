class ProjectsController < ApplicationController
  def index
  	@projects = Project.order("title").page(params[:page]).per(8)
  end

  def show
  	@project = Project.find(params[:id])
  end


  def destroy
  	@project = current_user.projects.find(params[:id])
  	@project.destroy
  	redirect_to my_projects_path, notice: "Consider it gone!"
  end

end
