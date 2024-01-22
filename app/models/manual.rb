class Manual < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :sentences, dependent: :destroy
  validates :title, presence: true, length: { maximum: 255 }
end
