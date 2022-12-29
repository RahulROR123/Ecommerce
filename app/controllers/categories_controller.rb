class CategoriesController < ApplicationController
	 def index
    @category = Category.all
	 end

	 def show
	 		@category = Category.find(params[:id])
	 end

	def create
	  @category = Category.new(category_params)
	  if  @category.save
	  	redirect_to root_path, notice: "Succefully created category"
	  else
	  	render 'new'
	  end
	 end

  def edit
    @category = Category.find(params[:id])
  end

	def update
    @category = Category.find(params[:id])
 
	  if @category.update(category_params)
	    redirect_to categories_path,  notice: "Succefully update category"
	   else
	    render 'edit'
	  end
  end


  def destroy
    @category = Category.find(params[:id])
    @category.destroy
 
    redirect_to categories_path, notice: "Succefully destroy category"
  end


	def category_params
		params.require(:category).permit(:name)	
	end

end
