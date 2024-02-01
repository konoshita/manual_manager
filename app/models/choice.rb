class Choice < ApplicationRecord
  belongs_to :question, dependent: :destroy
end
