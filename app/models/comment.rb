class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_presence_of :body

  scope :ordered, -> { order(:created_at) }
end
