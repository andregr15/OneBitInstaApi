class Api::V1::PostsController < Api::V1::ApiController
  def index
    @posts = User.find(params[:user_id]).posts
    serialize(@posts)
  end


  def create
    @post = current_user.posts.build(post_params)
    save_post || render_error(@post.errors.full_messages)
  end


  def show
    @post = Post.find(params[:id])
    serialize(@post)
  end


  def update
    @post = current_user.posts.find(params[:id])
    @post.attributes = post_params
    save_post || render_error(@post.errors.full_messages)
  end


  def destroy
    @post = current_user.posts.find(params[:id])
    destroy_post || render_error(@post.errors.full_messages)
  end


  private


  def save_post
    serialize(@post) if @post.save
  end


  def destroy_post
    head :ok if @post.destroy
  end


  def post_params
    params.require(:post).permit(:photo_base64, :description)
  end


  def serialize(obj)
    render json: PostSerializer.new(obj, params: { current_user: current_user }, 
                                         include: [:user, :hashtags])
                               .serializable_hash
  end
end
