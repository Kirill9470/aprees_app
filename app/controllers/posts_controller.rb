# Контроллер для постов
class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new_root_post, :create_root_post]

  def index
    @posts = Post.arrange_serializable
  end

  def show
    @children = Post.descendants_of(@post).arrange_serializable
  end

  def new_root_post
    @post = Post.new
  end

  def new
    @child_post = @post.children.new
  end

  def edit; end

  def create_root_post
    @post = Post.new(create_post_params)
    respond_to do |format|
      if @post.save
        format.html {redirect_to "/#{@post.name}"}
      else
        format.html {render :new_root_post}
      end
    end
  end

  def create
    @child_post = @post.children.new(create_post_params)
    respond_to do |format|
      if @child_post.save
        format.html {redirect_to "#{@child_post.create_ancestors_url}/#{@child_post.name}"}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(update_post_params)
        format.html {redirect_to "#{@post.create_ancestors_url}/#{@post.name}"}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html {redirect_to root_path}
    end
  end

  private

  def create_post_params
    params.require(:post).permit(:name, :title, :content)
  end

  def update_post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find_by(name: params[:name])
  end

end