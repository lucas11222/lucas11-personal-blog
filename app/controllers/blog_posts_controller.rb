class BlogPostsController < ApplicationController
  def index
      @posts = BlogPost.all
  end

  def show
      @post = BlogPost.find_by(id: params[:id])
  end
  def new
    @post = BlogPost.new
  end
  private
      def post_params
          params.require(:blog_post).permit(:title, :description, :body)
      end

end