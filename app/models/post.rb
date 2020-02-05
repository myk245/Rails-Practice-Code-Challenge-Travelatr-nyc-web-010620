class Post < ApplicationRecord
   belongs_to :blogger
   belongs_to :destination 

   validates :title, presence: true
   validates :content, length: { minimum: 100 }
end

# [x] A post should have a title
# [x] A post should have content longer than 100 characters
# [x] Users should be able to see a post's page with its title and content displayed. 
# On this page, a user should see:
# [x] A link to the page of that post's author
# [x] A link to the page of that post's destination
# [] A like button link that increases the like count for that post (should take the user to the same page)