class PostsController < ApplicationController
  before_action :require_login

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id  # 投稿者を紐付け

    if @post.save
      redirect_to posts_path, notice: "投稿が完了しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
