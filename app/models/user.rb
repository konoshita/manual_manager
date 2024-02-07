class User < ApplicationRecord
  has_many :manuals
  # has_many :quiz_to_user, dependent: :destroy
  # has_many :quizzes, through: :quiz_to_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def active_for_authentication?
    super && (is_deleted == false)
  end

  scope :not_is_deleted, -> { where(is_deleted: false) }

  enum role: { general: 0, admin: 1 ,editor: 2 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
