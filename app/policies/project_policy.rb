class ProjectPolicy < ApplicationPolicy
  permit :index, :show

  def create?
    user.admin?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
