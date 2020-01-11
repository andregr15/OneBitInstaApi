class Api::V1::UsersController < Api::V1::ApiController
  def show
    @user = User.find(params[:id])
    render json: UserSerializer.new(@user, params: { current_user: current_user }).serializable_hash
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :email, :photo_base64)
  end
end
