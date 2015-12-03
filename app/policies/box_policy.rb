class BoxPolicy < ApplicationPolicy
  def index?
    true
  end

  class Scope < Scope #This allows to view only the journals that belong to the user
    def resolve
      if !user.blank? && (user.admin?)
        scope.all
      else
        scope.where(user: user) #can i change this to include recipient?
      end
    end
  end
end
