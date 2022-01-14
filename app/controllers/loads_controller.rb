class LoadsController < ApplicationController
  before_action :set_load, only: %i[show edit update destroy]

  def index
    @loads = Load.all
  end

  def show
    if Current.user.id == @load.user_id
    extension = @load.title.split('.')
    send_file Rails.root.join('public', 'uploads', Current.user.id.to_s, @load.title),
              type: "application/#{extension[1]}", x_sendfile: true
    else
        fredirect_to loads_url
    end
  end

  def new
    @load = Load.new
  end

  def create
    dir = File.dirname(Rails.root.join('public', 'uploads', Current.user.id.to_s,'*.*'))
    FileUtils.mkdir_p(dir) unless File.directory?(dir)
    @load = Load.new(load_params)
    @load.user_id = Current.user.id
    uploaded_io = params[:load][:title]
    File.open(Rails.root.join('public', 'uploads', Current.user.id.to_s, uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @load.title = uploaded_io.original_filename
      if @load.save
       redirect_to loads_url, notice: 'Load was successfully created.'
      else

        render :new
      end
  end

  def destroy
    if Current.user.id == @load.user_id
    @load.destroy
    respond_to do |format|
      format.html { redirect_to loads_url, notice: 'Load was successfully destroyed.' }
      format.json { head :no_content }
      f = "public/uploads/#{Current.user.id}/#{@load.title}"
      File.delete(Rails.root.join(f)) if File.exist?(f)
    end
    end
  end

  private

  def set_load
    @load = Load.find(params[:id])
  end

  def load_params
    params.require(:load).permit(:cover_letter, :title, :user_id)
  end
end
