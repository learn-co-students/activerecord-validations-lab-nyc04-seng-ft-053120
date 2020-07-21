class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    clickbaits = [/Top\s\d/, /Won't Believe/, /Secret/, /Guess/]

    exist =  clickbaits.none? do |clickbait| 
      record.title.match(clickbait) if record.title 
    end
    
    if exist 
      record.errors[:title] << "No clickbait in title!!"
    end
  end
end