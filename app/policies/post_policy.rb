class PostPolicy < ApplicationPolicy
  permit :index, :show

  def manage?
    user.admin?
  end
end
