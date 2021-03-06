class PromosController < ApplicationController
  before_action :set_promo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index, :list]


  # GET /promos
  # GET /promos.json
  def index
    @promos = Promo.all
  end

  def list

    if params[:location] == ""
      location = "accra"
    @promos = Promo.where("product LIKE ? AND location LIKE ?", "%#{params[:product]}%", "%#{location}") 
    render 'list'
    else
       @promos = Promo.where("product LIKE ? AND location LIKE ?", "%#{params[:product]}%", "%#{params[:location]}%")
       render 'list'
    end
  end
  # GET /promos/1
  # GET /promos/1.json
  def show
  end

  def dashboard

  end
  def user_promos
    @promos = current_user.promos
  end
  # GET /promos/new
  def new
    @promo = Promo.new
  end

  # GET /promos/1/edit
  def edit
  end

  # POST /promos
  # POST /promos.json
  def create
    @promo = current_user.promos.create(promo_params)

    respond_to do |format|
      if @promo.save
        format.html { redirect_to action: 'index', notice: 'Promo was successfully created.' }
        format.json { render :show, status: :created, location: @promo }
      else
        format.html { render :new }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promos/1
  # PATCH/PUT /promos/1.json
  def update
    respond_to do |format|
      if @promo.update(promo_params)
        format.html { redirect_to action: 'index', notice: 'Promo was successfully updated.' }
        format.json { render :show, status: :ok, location: @promo }
      else
        format.html { render :edit }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promos/1
  # DELETE /promos/1.json
  def destroy
    @promo.destroy
    respond_to do |format|
      format.html { redirect_to promos_url, notice: 'Promo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promo
      @promo = Promo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promo_params
      params.require(:promo).permit(:description, :product, :shop, :location, :contact, :picture, :discount, :normal_price, :category, :image, :user_id)
    end
end
