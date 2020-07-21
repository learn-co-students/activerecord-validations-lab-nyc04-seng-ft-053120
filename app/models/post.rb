class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_must_be_clickbait


  def title_must_be_clickbait
    #  binding.pry
    title = self.title
    clickbait = ["Won't Believe", "Secret", "Top #{/\d/}","Guess"]
    if title == nil
       errors.add(:title, "title must exist")
    elsif !clickbait.any? { |phrase| title.include?(phrase) }
      errors.add(:title, "title must be clickbaity")
    end
  end
end
