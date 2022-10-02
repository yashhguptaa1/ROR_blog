class ArticlesController < ApplicationController

    # before any action method is done is done in this class
    # run set_article only for the mentioned action
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    def show
        # binding.break
        # @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        # @article = Article.find(params[:id])
    end

    # create action happens behind the scenes so we dont need view template for create
    def create
        @article = Article.new(article_params)
        # puts @article.save
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article
        else
            render 'new'
            # for rails 7 render 'new', status: 422
            # basically it tells which view to display on completion
        end
    end

    def update
        # @article = Article.find(params[:id])
        if @article.update(article_params)
          flash[:notice] = "Article was updated successfully."
        
          # same as doing= redirect_to article_path(@articles)
          redirect_to @article
        else
          render 'edit'
        end
    end

    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    # make sure private is after all the public methods
    # everything below private is not accessible outside
    private
    
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end

# @ converts normal variable to instance variable 
# normal variable is only accessible in method
# instance variable accessible outside to views

# The create action is used to handle the form submission from the new article creation form. 
# The code added for the entire new article creation process to this point can be found here:

# https://github.com/udemyrailscourse/alpha-blog-6/commit/931d7f3f1287b99084d9d0a49bd45fc5c9ba43eb

# Things to keep in mind: Strong parameters - whitelisting of data (values associated with attributes) 
# that are received through the params hash.
#  During this process for articles you had to 'whitelist' the data coming through for the title 
#  and description fields.
# .permit is used to whitelist
# why we use redirect_to @article :basically we use Prefix for route
# --[ Route 6 ]------------------------------------------------
# Prefix            | article
# Verb              | GET
# URI               | /articles/:id(.:format)
# Controller#Action | articles#show