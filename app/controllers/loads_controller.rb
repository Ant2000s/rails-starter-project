class LoadsController < ApplicationController
  before_action :set_load, only: %i[ show edit update destroy ]

  # GET /loads or /loads.json
  def index
    @loads = Load.all
  end

  # GET /loads/1 or /loads/1.json
  def show
  end

  # GET /loads/new
  def new
    @load = Load.new
  end

  # GET /loads/1/edit
  def edit
  end

  # POST /loads or /loads.json
  def create
    @load = Load.new(load_params)

    respond_to do |format|
      if @load.save
        format.html { redirect_to @load, notice: "Load was successfully created." }
        format.json { render :show, status: :created, location: @load }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loads/1 or /loads/1.json
  def update
    respond_to do |format|
      if @load.update(load_params)
        format.html { redirect_to @load, notice: "Load was successfully updated." }
        format.json { render :show, status: :ok, location: @load }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loads/1 or /loads/1.json
  def destroy
    @load.destroy
    respond_to do |format|
      format.html { redirect_to loads_url, notice: "Load was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load
      @load = Load.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def load_params
      params.require(:load).permit(:cover_letter, :title)
    end
end
