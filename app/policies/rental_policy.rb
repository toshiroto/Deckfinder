class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    user_is_owner? || user_is_admin?
  end

  private

  def user_is_owner?
    record.deck.user == user
  end

  def user_is_admin?
    user.admin?
  end
end
