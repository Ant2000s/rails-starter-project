class LoadsController < ApplicationController
  before_action :set_load, only: %i[show edit update destroy]

  # GET /loads or /loads.json
  def index
    @loads = Load.all
  end

  # GET /loads/1 or /loads/1.json
  def show
    if Current.user.id == @load.user_id
    extension = @load.title.split('.')
    send_file Rails.root.join('public', 'uploads', Current.user.id.to_s, @load.title),
              type: "application/#{extension[1]}", x_sendfile: true
    else
      respond_to do |format|
        format.html { redirect_to loads_url}
        format.json { render status: :created, location: @load }
      end
    end
  end

  # GET /loads/new
  def new
    @load = Load.new
  end

  # GET /loads/1/edit
  def edit; end

  # POST /loads or /loads.json
  def create
    dir = File.dirname("#{Rails.root}/public/uploads/#{Current.user.id}/*.*")
    FileUtils.mkdir_p(dir) unless File.directory?(dir)
    @load = Load.new(load_params)
    @load.user_id = Current.user.id
    uploaded_io = params[:load][:title]
    File.open(Rails.root.join('public', 'uploads', Current.user.id.to_s, uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @load.title = uploaded_io.original_filename
    respond_to do |format|
      if @load.save
        format.html { redirect_to loads_url, notice: 'Load was successfully created.' }
        format.json { render status: :created, location: @load }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loads/1 or /loads/1.json
  def update
    if Current.user.id == @load.user_id
    respond_to do |format|
      if @load.update(load_params)
        format.html { redirect_to loads_url, notice: 'Load was successfully updated.' }
        format.json { render :show, status: :ok, location: @load }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /loads/1 or /loads/1.json
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

  # Use callbacks to share common setup or constraints between actions.
  def set_load
    @load = Load.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def load_params
    params.require(:load).permit(:cover_letter, :title, :user_id)
  end
end
