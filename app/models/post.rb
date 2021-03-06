class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?


  def clickbait?
    if [/Won't Believe|Secret|Top \d|Guess/i].none? {|p| p.match?(self.title)}
      errors.add(:title, "not clickbait-y enough")
    end
  end

end

