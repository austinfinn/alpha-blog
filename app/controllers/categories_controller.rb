class CategoriesController < ApplicationController

  before_action :require_admin_user, only: [:create, :new]
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @category = Category.new
  end
  
  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end
  
  def create
    @category = Category.new(category_params)
    
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
  
  def require_admin_user
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:danger] = "Only admin users can create new categories"
      redirect_to categories_path
    end
  end
end