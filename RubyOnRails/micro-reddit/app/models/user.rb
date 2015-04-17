class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :name, presence: true
  validates :name, length: { maximum:20 }
  validates :name, uniqueness: true

  validates :email, presence: true
  validates :email, length: { maximum:30 }
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
end
