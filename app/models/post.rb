class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of :title, :body

  scope :ordered, -> { order(:created_at) }
end
