class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    # user_rented_already?
    # raise
    true
  end

  def show?
    user_is_owner? || user_is_admin? || record.user == user
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

  # def user_rented_already?
  #   user.records.includes?(record.deck)
  # end
end
