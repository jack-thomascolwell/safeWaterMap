class PointsController < ApplicationController
  def index
    @points = Point.all
    @point = Point.new
    @bans = Ban.all
  end

  def create
    @ban = Ban.where(ip: request.remote_ip, time: (Time.now - 24.hours)..Time.now);
    if @ban[0]
      session[:ban_alert] = true;
      head 403
    else
      @point = Point.where(latitude: params[:latitude], longitude: params[:longitude]).first_or_create!(ppb: params[:ppb]).update(ppb: params[:ppb])
      @ban = Ban.where(ip: request.remote_ip).first_or_create!(time: Time.now).update(time: Time.now)
    end
  end
end
