class Api::V1::FollowingsController < Api::V1::ApiController
  def index
    user = User.find(params[:user_id])
    followers = UserSerializer.new(user.followers.map(&:follower), params: { current_user: current_user }).serializable_hash
    followings = UserSerializer.new(user.followeds.map(&:followed), params: { current_user: current_user }).serializable_hash
    render json: { followers: followers, followings: followings }
  end


  def create
    @following = current_user.followeds.build(followed_id: params[:user_id])
    save_following || render_error(@following.errors.full_messages)
  end


  def destroy
    @following = current_user.followeds.find_by(followed_id: params[:user_id])
    destroy_following || render_error("This following can't be destroyed")
  end


  private


  def save_following
    head :ok if @following.save
  end


  def destroy_following
    head :ok if @following.destroy
  end


  def render_error(errors)
    render json: { errors: errors }, status: :unprocessable_entity
  end
end
