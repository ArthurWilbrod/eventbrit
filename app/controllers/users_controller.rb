class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :user_id_only, only: [:show]


  def show

  end

  private

  def user_id_only
    userid =User.where(email:current_user.email).first
    puts "ICICIC"
    uid =userid.id
    urid = params[:id]
    uid= uid.to_i
    urid= urid.to_i

    if (uid!=urid)
      flash[:error] = "You must be logged in to access this section"
      redirect_to events_path # halts request cycle
    end
  end

end
