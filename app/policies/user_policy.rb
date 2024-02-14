class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def create?
    true
  end

  def update?
    user.admin? || user == record
  end

  def withdrawal
    user.admin?
  end

  def destroy?
    user != record && create?
  end

  def permitted_attributes
    if user&.admin?
      %i[name role avatar password password_confirmation]
    else
      %i[avatar password password_confirmation]
    end
  end
end
