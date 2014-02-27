class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  # Remember to create a migration!

  def creation_time
    creation_time = Time.now - self.created_at
  end

end
