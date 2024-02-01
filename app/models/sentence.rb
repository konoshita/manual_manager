class Sentence < ApplicationRecord
  belongs_to :manual
  acts_as_list scope: :manual
  validates :content, presence: true, length: { maximum: 400 }

  mount_uploader :sentence_image, SentenceImageUploader
end
