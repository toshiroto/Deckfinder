class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    rental_arr = user.rentals
    condition_arr = rental_arr.find {|rental| rental.deck == @deck }
    condition_arr == nil
  end

  def show?
    user_is_owner? || user_is_admin? || record.user == user
  end

  def update?
    user_is_owner? || user_is_admin?
  end

  def destroy?
    user_created_rental? || user_is_admin?
  end

  private

  def user_is_owner?
    record.deck.user == user
  end

  def user_is_admin?
    user.admin?
  end

  def user_created_rental?
    user == record.user
  end
end
