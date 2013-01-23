class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end

  def create
     @category = Category.new (params[:category])
     @category.created_by = current_user.id
     @category.updated_by = current_user.id

     if @category.save
       flash[:notice] = "Successfully created a new event category."
       redirect_to categories_path
     else
       flash[:notice] = @category.errors.full_messages.join(", ")
       render :action => :new
     end
  end


  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    if @category.destroy
      flash[:notice] = "Successfully deleted Category."
      redirect_to categories_url
    else
      flash[:notice] = "Category Could Not Be deleted."
      redirect_to categories_url
    end
  end


  def edit
      @category = Category.find(params[:id])
  end


  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Successfully Updated Category."
      redirect_to categories_path
    else
      flash[:notice] = "Category Could Not Be Updated."
      render :action => :edit
    end
  end
end