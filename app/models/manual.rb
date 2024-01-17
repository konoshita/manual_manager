class Manual < ApplicationRecord
  belongs_to :user
  has_many :categories, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
end
