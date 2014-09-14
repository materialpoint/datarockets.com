class PagePolicy < ApplicationPolicy
  permit :show

  def manage?
    user.admin?
  end
end
