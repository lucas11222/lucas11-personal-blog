class BlogPostsController < ApplicationController

  def index
      @posts = BlogPost.all
  end

  def show
      @post = BlogPost.find_by(id: params[:id])
  end

  def create
      puts params[:title]
      @post = BlogPost.new(post_params)
      if @post
          @post.save
      end
  end


  def update
      @post = BlogPost.find_by(id: params[:id])
      if @post
          @post.update(post_params)
      end
  end

  def destroy
      @post = BlogPost.find_by(id: params[:id])
      if @post
          @post.destroy
      end
  end

  private
      def post_params
          params.require(:blog_post).permit(:title, :description, :body)
      end

end