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
    case params[:shout][:content_type]
    when 'TextShout' then TextShout.new(text_shout_content_params)
    when 'PhotoShout' then PhotoShout.new(photo_shout_content_params)
    end

  end

  def text_shout_content_params
    params.require(:shout).require(:content).permit(:body)
  end

  def photo_shout_content_params
    params.require(:shout).require(:content).permit(:image)
  end

  def redirect_options(shout)
    if shout.persisted?
      return {notice: 'Shout Created Successfully' }
    else
      return {alert: 'Shout not created!!'}
    end

  end
end