class Post < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true, title: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { in: 9..10 }
  validates :category, inclusion: { in: %w(Fiction) }
end
