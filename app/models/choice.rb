class Choice < ApplicationRecord
  belongs_to :question, dependent: :destroy
  validates :content, presence: true, length: { maximum: 150 }
end
