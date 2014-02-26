class Post < ActiveRecord::Base
  has_many :comments
  has_one :user, through: :comment

  # Remember to create a migration!
end
