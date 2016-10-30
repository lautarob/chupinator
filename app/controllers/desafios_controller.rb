class DesafiosController < ApplicationController
  before_action :set_desafio, only: [:show, :edit, :update, :destroy]

  # GET /desafios
  # GET /desafios.json
  def index
    @desafios = Desafio.all
  end

  # GET /desafios/1
  # GET /desafios/1.json
  def show
  end

  def get_desafio_random
    @desafios = Desafio.where(nil)
    filtering_params(params).each do |key, value|
      @desafio = @desafios.public_send(key, value).offset(rand(Desafio.count)).first if value.present?
    end
    respond_to do |format|
      format.html { redirect_to @desafio, notice: 'Desafio was successfully created.' }
      format.json { render @desafio }
    end
  end

  # GET /desafios/new
  def new
    @desafio = Desafio.new
  end

  # GET /desafios/1/edit
  def edit
  end

  # POST /desafios
  # POST /desafios.json
  def create
    @desafio = Desafio.new(desafio_params)

    respond_to do |format|
      if @desafio.save
        format.html { redirect_to @desafio, notice: 'Desafio was successfully created.' }
        format.json { render :show, status: :created, location: @desafio }
      else
        format.html { render :new }
        format.json { render json: @desafio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desafios/1
  # PATCH/PUT /desafios/1.json
  def update
    respond_to do |format|
      if @desafio.update(desafio_params)
        format.html { redirect_to @desafio, notice: 'Desafio was successfully updated.' }
        format.json { render :show, status: :ok, location: @desafio }
      else
        format.html { render :edit }
        format.json { render json: @desafio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desafios/1
  # DELETE /desafios/1.json
  def destroy
    @desafio.destroy
    respond_to do |format|
      format.html { redirect_to desafios_url, notice: 'Desafio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desafio
      @desafio = Desafio.find(params[:id])
    end

    # A list of the param names that can be used for filtering the Product list
    def filtering_params(params)
      params.slice(:id, :tipo)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def desafio_params
      params.require(:desafio).permit(:tipo, :titulo, :descripcion, :puntos)
    end
end
