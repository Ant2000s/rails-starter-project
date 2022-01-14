class LoadsController < ApplicationController
  before_action :set_load, only: %i[show destroy]

  def index
    @loads = Load.all
  end

  def show
    if Current.user.id == @load.user_id
      extension = @load.title.split('.')
      send_file Rails.root.join('public', 'uploads', Current.user.id.to_s, @load.title),
                type: "application/#{extension[1]}", x_sendfile: true
    else
      redirect_to loads_url
    end
  end

  def new
    @load = Load.new
  end

  def destroy
    @load.destroy
    redirect_to loads_url, notice: 'Load was successfully deleted.'
    f = "public/uploads/#{Current.user.id}/#{@load.title}"
    File.delete(Rails.root.join(f)) if File.exist?(f)
  end

  private

  def set_load
    @load = Load.find(params[:id])
  end
end
