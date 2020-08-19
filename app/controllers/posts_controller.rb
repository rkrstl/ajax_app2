class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC")

  end

 
  def create
    Post.create(content:params[:content])
    redirect_to action: :index
  end

  def checked
    post=Post.find(params[:id])
    if post.checked 
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    # 更新したレコードを取得し直してJSON形式（Deta)としてchecked.jsに送る
    item = Post.find(params[:id])
    render json: { post: item }
  end


end
