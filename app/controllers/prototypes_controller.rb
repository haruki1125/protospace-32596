class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :move_to_index, only: [:edit]
  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    
    @prototype = Prototype.new(proto_params)
    
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
    
  
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments= Comment.all
    
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(proto_params)

    if prototype.update(proto_params)
      redirect_to prototype_path(prototype.id)
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
    

  end



  private

  def proto_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end