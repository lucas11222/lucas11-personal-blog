class ApiController < ApplicationController
skip_before_action :verify_authenticity_token
rescue_from ActionController::ParameterMissing, with: :render_parameter_missing
  def index
    @posts = BlogPost.all
    render json: @posts
end

def show
    @post = BlogPost.find_by(id: params[:id])
    if @post
        render json: @post
    else
        render json: { error: 'Post not found. Check the ID.' }, status: :not_found
    end
end

def create
    @post = BlogPost.new(post_params)
    if @post.save
        render json: { post_created: @post, success: true }, status: :created
    else
      render json: { error: 'Failed to create post. Maybe check the params?', success: false }, status: :unprocessable_entity
    end
  end


def update
    @post = BlogPost.find_by(id: params[:id])
    if @post
      if @post.update(post_params)
        render json: { post_updated: @post, success: true }, status: :ok
      else
        render json: { error: 'Invalid data', messages: @post.errors.full_messages, success: false }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Post not found. Check the ID.', success: false }, status: :not_found
    end
  end


def destroy
    @post = BlogPost.find_by(id: params[:id])
    if @post
        @post.destroy
        render json: { message: 'Post deleted successfully :(', success: true }, status: :ok
      else
        render json: { error: 'Post not found. Check the ID.', success: false }, status: :not_found
    end
end

private

    def render_parameter_missing(exception)
        render json: { error: exception.message, success: false}, status: :unprocessable_entity
    end
    def post_params
        params.require(:blog_post).permit(:title, :description, :body)
    end

end
