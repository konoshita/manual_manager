class Question < ApplicationRecord
  has_many :choices
  belongs_to :quiz
  accepts_nested_attributes_for :choices, allow_destroy: true, reject_if: :all_blank
  validates :body, presence: true, length: { maximum: 150 }
end
