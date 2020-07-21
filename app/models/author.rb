class Author < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :phone_number, presence: true, length: { is: 10 }, format: { with: /\A[0-9]+\z/, message: "only allows numbers" }
end
