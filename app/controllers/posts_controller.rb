class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to root_path, notice: "POST SAVED"
    else
      render 'new', notice: "Unable to save POST"
    end
  end

  def edit

  end

  def update
    if @post.update post_params
      redirect_to root_path, notice: "Article saved"
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
