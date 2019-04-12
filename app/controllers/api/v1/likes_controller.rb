class Api::V1::LikesController < Api::V1::ApiController
  def create
    @like = current_user.likes.build(likeable_id: params[:id], likeable_type: params[:likeable_type])
    save_like || render_error(@like.errors.full_messages)
  end


  def destroy
    @like = current_user.likes.find_by(likeable_id: params[:id], likeable_type: params[:likeable_type])
    destroy_like || render_error(@like.errors.full_messages)
  end


  private


  def save_like
    head :ok if @like.save
  end


  def destroy_like
    head :ok if @like.destroy
  end
end
