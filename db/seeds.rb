# USER CREATION

User.transaction do

  @alaskan = User.create(name: "Alaskan Malamute", email: "alaskan@dog.com", 
                        password: "12345678", password_confirmation: "12345678")
  @alaskan.photo.attach(io: File.open(Rails.root.join("db/seed_images/users/alaskan-malamute.jpg")), 
                      filename: "alaskan-malamute.jpg")

  @beagle = User.create(name: "Beagle", email: "beagle@dog.com", 
                      password: "12345678", password_confirmation: "12345678")
  @beagle.photo.attach(io: File.open(Rails.root.join("db/seed_images/users/beagle.jpg")),
                      filename: "beagle.jpg")

  @hovawart = User.create(name: "Hovawart", email: "hovawart@dog.com", 
                        password: "12345678", password_confirmation: "12345678")
  @hovawart.photo.attach(io: File.open(Rails.root.join("db/seed_images/users/hovawart.jpg")),
                        filename: "hovawart.jpg")

  @pomeranian = User.create(name: "Pomeranian", email: "pomeranian@dog.com", 
                          password: "12345678", password_confirmation: "12345678")
  @pomeranian.photo.attach(io: File.open(Rails.root.join("db/seed_images/users/pomeranian.jpg")),
                          filename: "pomeranian.jpg")

  @shikoku = User.create(name: "Shikoku", email: "shikoku@dog.com", 
                        password: "12345678", password_confirmation: "12345678")
  @shikoku.photo.attach(io: File.open(Rails.root.join("db/seed_images/users/shikoku.jpg")),
                      filename: "shikoku.jpg")

  @cymric = User.create(name: "Cymric", email: "cymric@cat.com", 
                      password: "12345678", password_confirmation: "12345678")
  @cymric.photo.attach(io: File.open(Rails.root.join("db/seed_images/users/cymric.jpg")),
                      filename: "cymric.jpg")

  @exotic_shorthair = User.create(name: "Exotic Shorhair", email: "exotic-shorthair@cat.com", 
                                password: "12345678", password_confirmation: "12345678")
  @exotic_shorthair.photo.attach(io: File.open(Rails.root.join("db/seed_images/users/exotic-shorthair.jpg")),
                                filename: "exotic-shorthair.jpg")

  @korat = User.create(name: "Korat", email: "korat@cat.com", 
                      password: "12345678", password_confirmation: "12345678")
  @korat.photo.attach(io: File.open(Rails.root.join("db/seed_images/users/korat.jpg")),
                    filename: "korat.jpg")

  @ragdoll = User.create(name: "Ragdoll", email: "ragdoll@cat.com", 
                        password: "12345678", password_confirmation: "12345678")
  @ragdoll.photo.attach(io: File.open(Rails.root.join("db/seed_images/users/ragdoll.jpg")),
                      filename: "ragdoll.jpg")

  @turkish_van = User.create(name: "Turkish Van", email: "turkish-van@cat.com", 
                            password: "12345678", password_confirmation: "12345678")
  @turkish_van.photo.attach(io: File.open(Rails.root.join("db/seed_images/users/turkish-van.jpg")),
                          filename: "turkish-van.jpg")

end


# @alaskan POSTS

Post.transaction do

  @post1 = @alaskan.posts.new(description: "Playing with my friend #lotoffun #happydog")
  @post1.save(validate: false)
  @post1.photo.attach(io: File.open(Rails.root.join("db/seed_images/posts/dog-playing-01.jpg")),
                          filename: "dog-playing-01.jpg")

  @post2 = @alaskan.posts.new(description: "More fun! #happydog")
  @post2.save(validate: false)
  @post2.photo.attach(io: File.open(Rails.root.join("db/seed_images/posts/dog-playing-02.jpg")),
                    filename: "dog-playing-02.jpg")

  @post3 = @alaskan.posts.new(description: "*.*")
  @post3.save(validate: false)
  @post3.photo.attach(io: File.open(Rails.root.join("db/seed_images/posts/dog-ball-01.jpg")),
                    filename: "dog-ball-01.jpg")

end

# @hovawart POSTS

Post.transaction do
  
  @post4 = @hovawart.posts.new(description: "Cute cat! #ilovecats")
  @post4.save(validate: false)
  @post4.photo.attach(io: File.open(Rails.root.join("db/seed_images/posts/cat-playing-01.jpg")),
                    filename: "cat-playing-01.jpg")

end


# @ragdoll POSTS

Post.transaction do

  @post5 = @ragdoll.posts.new(description: "Dogs are awesome! #ilovedogs")
  @post5.save(validate: false)
  @post5.photo.attach(io: File.open(Rails.root.join("db/seed_images/posts/dog-ball-02.jpg")),
                    filename: "dog-ball-02.jpg")

  @post6 = @ragdoll.posts.new(description: "Crazy creatures! #ilovedogs")
  @post6.save(validate: false)
  @post6.photo.attach(io: File.open(Rails.root.join("db/seed_images/posts/dog-ball-03.jpg")),
                    filename: "dog-ball-03.jpg")

  @post7 = @ragdoll.posts.new(description: "I want to play")
  @post7.save(validate: false)
  @post7.photo.attach(io: File.open(Rails.root.join("db/seed_images/posts/dog-playing-03.jpg")),
                    filename: "dog-playing-03.jpg")

end


# TURKISH VAN POSTS    

Post.transaction do

  @post8 = @turkish_van.posts.new(description: "'Little' friend :)")
  @post8.save(validate: false)
  @post8.photo.attach(io: File.open(Rails.root.join("db/seed_images/posts/dog-ball-01.jpg")),
                    filename: "dog-ball-01-1.jpg")

end


# POMERIAN POSTS

Post.transaction do

  @post9 = @pomeranian.posts.new(description: "Oown! *.* #ilovecats")
  @post9.save(validate: false)
  @post9.photo.attach(io: File.open(Rails.root.join("db/seed_images/posts/cat-playing-02.jpg")),
                    filename: "cat-playing-02.jpg")

end


# LIKE POST 01

Like.transaction do

  @beagle.likes.create(likeable: @post1)
  @hovawart.likes.create(likeable: @post1)
  @shikoku.likes.create(likeable: @post1)
  @korat.likes.create(likeable: @post1)
  @turkish_van.likes.create(likeable: @post1)

end


# LIKE POST 3

Like.transaction do

  @beagle.likes.create(likeable: @post3)
  @ragdoll.likes.create(likeable: @post3)

end


# LIKE POST 4

Like.transaction do

  @beagle.likes.create(likeable: @post4)
  @exotic_shorthair.likes.create(likeable: @post4)
  @korat.likes.create(likeable: @post4)
  @alaskan.likes.create(likeable: @post4)

end


# LIKE POST 7

Like.transaction do

  @exotic_shorthair.likes.create(likeable: @post4)
  @korat.likes.create(likeable: @post4)
  @alaskan.likes.create(likeable: @post4)

end


# FOLLOWS @alaskan

Following.transaction do

  @alaskan.followers.create(follower: @beagle)
  @alaskan.followers.create(follower: @ragdoll)
  @alaskan.followers.create(follower: @korat)
  @alaskan.followers.create(follower: @hovawart)
  @alaskan.followers.create(follower: @turkish_van)

end


# FOLLOWS @ragdoll

Following.transaction do

  @ragdoll.followers.create(follower: @exotic_shorthair)
  @ragdoll.followers.create(follower: @cymric)
  @ragdoll.followers.create(follower: @shikoku)
  @ragdoll.followers.create(follower: @beagle)
  
end