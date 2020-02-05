class Blogger < ApplicationRecord
   has_many :posts 
   has_many :destinations, through: :posts 

   validates :name, presence: true 
   validates :name, uniqueness: true
   validates :bio, length: { minimum: 30 }
   validate :minimum_age 

   def minimum_age
      if age < 1
         errors.add(:age, "age must be greater than 0")
      end 
   end 

end

# Bloggers should have unique names and ages above 0, and their bio should be over 30 characters long.