class Sentence < ApplicationRecord
  belongs_to :manual
  validates :content, presence: true, length: { maximum: 400 }

  mount_uploader :sentence_image, SentenceImageUploader
end
