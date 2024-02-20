class Sentence < ApplicationRecord
  belongs_to :manual
  acts_as_list scope: :manual
  validates :content, presence: true, length: { maximum: 1000 ,too_long: "最大%{count}文字まで使えます" }

  mount_uploader :sentence_image, SentenceImageUploader
end
