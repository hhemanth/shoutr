class ShoutsController < ApplicationController
  def create
    shout = current_user.shouts.create(shout_params)
    redirect_to root_path, redirect_options(shout)
  end

  def shout_params
    params.require(:shout).permit(:body)
  end

  def redirect_options(shout)
    if shout.persisted?
      return {notice: 'Shout Created Successfully' }
    else
      return {alert: 'Shout not created!!'}
    end

  end
end