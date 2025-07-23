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
  
    def create
      @post = BlogPost.new(post_params)
      if @post.save
        redirect_to blog_post_path(@post), notice: 'Post created. yay!'
      else
        render :new
      end
    end

    def edit
      @post = BlogPost.find_by(id: params[:id])
    end

    def update
      @post = BlogPost.find_by(id: params[:id])
      if @post.update(post_params)
        redirect_to blog_post_path(@post), notice: 'Post updated!'
      else
        render :edit
      end
    end
  
    def destroy
      @post = BlogPost.find_by(id: params[:id])
      if @post
          @post.destroy
          redirect_to "/", notice: 'Post deleted :('
        else
          redirect_to "/", notice: 'Post not found. Check the ID.'
      end
  end

    private
  
    def post_params
      params.require(:blog_post).permit(:title, :description, :body)
    end
  end
