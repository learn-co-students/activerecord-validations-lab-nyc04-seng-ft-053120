class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbaity?

    private

    def clickbaity?
        return if title.blank?
        if !title.match?(/Won't Believe|Secret|Top \d+/)
            errors.add(:title, "must contain a click bait")
        end
    end

end
