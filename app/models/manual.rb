class Manual < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookmarks, dependent: :destroy
  has_many :sentences, -> { order(position: :asc) }, dependent: :destroy
  validates :title, presence: true, length: { maximum: 255 }

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "id", "title", "updated_at", "user_id"]
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
end
