class ApiController < ApplicationController
  def index
    @posts = BlogPost.all
    render json: @posts
end

def show
    @post = BlogPost.find_by(id: params[:id])
    render json: @post
end

def create
    puts params[:title]
    @post = BlogPost.new(post_params)
    if @post
        @post.save
        render json: @post, status: :created
    else
        render json: { error: 'Failed to create post' }, status: :unprocessable_entity
    end
end


def update
    @post = BlogPost.find_by(id: params[:id])
    if @post
        @post.update(post_params)
        render json: @post, status: :ok
    else
        render json: { error: 'Post not found. Check the ID.' }, status: :not_found
    end
end

def destroy
    @post = BlogPost.find_by(id: params[:id])
    if @post
        @post.destroy
      else
        render json: { error: 'Post not found. Check the ID.' }, status: :not_found
    end
end

private
    def post_params
        params.require(:blog_post).permit(:title, :description, :body)
    end

end
