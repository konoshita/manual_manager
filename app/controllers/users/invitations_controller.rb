class Users::InvitationsController < Devise::InvitationsController
  before_action :check_admin
  def new
    super
  end

  def create
     super
  end

  def edit
     super
  end

  def update
    super
  end

  def destroy
     super
  end

end
