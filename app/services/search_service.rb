class SearchService
  def initialize(expression)
    @expression = expression
  end


  def call
    {
      users: search_users,
      posts: search_hashtags
    }
  end


  private


  def search_users
    users = User.where("email LIKE ?", "%#{@expression}%")
    UserSerializer.new(users).serializable_hash
  end


  def search_hashtags
    posts = Post.joins(hashtag_mappings: :hashtag).where("hashtags.name LIKE ?", "%#{@expression}%")
    PostSerializer.new(posts, include: [:user, :hashtags]).serializable_hash
  end
end
