class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :title, length: { maximum:20 }

  validates :body, presence: true
  validates :body, length: { maximum:140 }
end
