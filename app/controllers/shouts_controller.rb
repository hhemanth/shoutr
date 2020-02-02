class ShoutsController < ApplicationController
  def create
    shout = current_user.shouts.create(shout_params)
    redirect_to root_path, redirect_options(shout)
  end

  def show
    @shout = Shout.find(params[:id])
  end

  def shout_params
    { content: content_from_params}
  end

  def content_from_params
    TextShout.new(content_params)
  end

  def content_params
    params.require(:shout).require(:content).permit(:body)
  end

  def redirect_options(shout)
    if shout.persisted?
      return {notice: 'Shout Created Successfully' }
    else
      return {alert: 'Shout not created!!'}
    end

  end
end