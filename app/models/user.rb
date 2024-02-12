class User < ApplicationRecord
  has_many :manuals
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_manuals, through: :bookmarks, source: :manual
  # has_many :quiz_to_user, dependent: :destroy
  # has_many :quizzes, through: :quiz_to_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  scope :not_is_deleted, -> { where(is_deleted: false) }

  enum role: { general: 0, admin: 1 ,editor: 2 }
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable, invite_for: 24.hours

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def admin_ok?
    admin? || role == "editor"
  end

  def bookmark(manual)
    bookmark_manuals << manual
  end

  def unbookmark(manual)
    bookmark_manuals.delete(manual)
  end

  def bookmark?(manual)
    bookmark_manuals.include?(manual)
  end

end
