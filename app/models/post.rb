class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length:{minimum: 250}
    validates :summary, length:{maximum: 250}
    validates :category, inclusion:{in:["Fiction", "Non-Fiction"]}
    validate :click_bait 

    def click_bait
        if self.title
            errors.add(:title, 'must be clickbait-y.') if !self.title.match?(/Won\'t|Believe|Secret|Guess|Top\ \d+/)
          
        end
    end

end
