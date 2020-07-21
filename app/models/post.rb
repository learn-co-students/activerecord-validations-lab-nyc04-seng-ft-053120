class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait?

  REG_PATS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d*/i,
    /Guess/i
  ]

  def clickbait?
    matched = REG_PATS.any? { |pat| pat.match(self.title) }

    if !matched
      self.errors.add(:title, "not clickbait-y enough")
    end
  end 
end
