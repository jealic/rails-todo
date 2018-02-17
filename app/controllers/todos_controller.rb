class TodosController < ApplicationController
  before_action :first_act, only: [:edit, :destroy, :update]

  def index
    @todos = Todo.all.order(date: :asc)
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "You've added an event."
      redirect_to root_path
    else
      flash[:alert] = "The grid can't be blank!"
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to todos_url
      flash[:notice] = "List updated."
    else
      render :action => :edit
    end
  end

  def destroy
    @todo.destroy
    flash[:notice] = "You've deleted an event."
    redirect_to todos_path
  end


  private

    def todo_params
      params.require(:todo).permit(:title, :date, :description)
    end

    def first_act
      @todo = Todo.find(params[:id])
    end 
end
