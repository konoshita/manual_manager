class Choice < ApplicationRecord
  belongs_to :question, dependent: :destroy
  has_one    :master,  through: :question
  validates :content, presence: true, length: { maximum: 150 }
end
