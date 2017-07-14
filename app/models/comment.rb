class Comment < ApplicationRecord
  belongs_to :article
end

# Create a new comment via the console:
# a = Article.first
# a.comments.create(author_name: "Some name", body: "Some text")

# Create builds and saves an object to the db in one step
# while if you use .new, you need use .save as well

# Force a cache clear with 'a.reload'