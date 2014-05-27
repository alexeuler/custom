class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @pos = [1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100, 2200, 2300, 2500, 2600, 2700, 2900, 3000, 3200, 3500, 3600, 5200, 5300, 5400, 5600, 6100, 7000, 7100, 7400, 8600, 11600, 12000, 12100, 12400, 12600, 12700, 12900, 13000, 13100, 13200, 13300, 13400, 13500, 19200, 19300, 19500, 19600, 19700, 19800, 19900, 20000, 20100, 20200, 20300, 20500, 20600, 20700, 20800, 20900, 21000, 21200, 21300, 21500, 21600, 21700, 21800, 21900, 22000, 22100, 22200, 22300, 22400, 22500, 22600, 22700, 22800, 22900, 23000, 23100, 23200, 23300, 23400, 23500, 23700, 23800, 23900, 24000, 24100, 24200, 24300, 24400, 24500, 24600, 24700, 24800, 24900, 25000, 25100, 25200, 25300, 25400, 25500, 25600, 25700, 25800, 25900, 26000, 26100, 26200, 26300, 26400, 26500, 26600, 26700, 26800, 26900, 27000, 27100, 27200, 27300, 27400,27500]
    @names = ["BSH498", "BSH499", "BSH500", "BSH506", "BSH509", "BSH539", "BSH540", "BSH541", "BSH542", "BSH546", "BSH549", "BSH550", "BSH555", "BSH556", "BSH568", "BSH569", "BSH570", "BSH573", "BSH574", "BSH576", "BSH581", "BSH582", "BSHA01", "BSHA02", "BSHA03", "BSHE00", "BSHG92", "BSHH17", "BSHH18", "BSHH29", "BSHH52", "BSHH84", "BSHH88", "BSHH89", "BSHH92", "BSHH94", "BSHH95", "BSHH97", "BSHH98", "BSHH99", "BSHK00", "BSHK01", "BSHK02", "BSHK03", "OSDS_TC32", "OSDS_TC33", "OSDS_TC35", "OSDS_TC49", "OSDS_TC50", "OSDS_TC51", "OSDS_TC52", "OSDS_TC53", "OSDS_TC54", "OSDS_TC55", "OSDS_TC56", "OSDS_TC58", "OSDS_TF01", "OSDS_TF02", "OSDS_TF03", "OSDS_TF04", "OSDS_TF05", "OSDS_TF08", "OSDS_TF09", "OSDS_TF11", "OSDS_TF13", "OSDS_TF14", "OSDS_TF15", "OSDS_TF16", "OSDS_TF17", "OSDS_TF19", "OSDS_TF20", "OSDS_TF21", "OSDS_TF22", "OSDS_TF24", "OSDS_TF25", "OSDS_TF26", "OSDS_TF27", "OSDS_TF28", "OSDS_TF29", "OSDS_TF30", "OSDS_TF31", "OSDS_TF32", "OSDS_TF33", "OSDS_TF34", "OSDS_TF36", "OSDS_TF37", "OSDS_TF39", "OSDS_TF41", "OSDS_TF42", "OSDS_TF43", "OSDS_TF44", "OSDS_TF45", "OSDS_TF56", "OSDS_TF58", "OSDS_TU03", "OSDS_TU04", "OSDS_TU05", "OSDS_TU06", "OSDS_TU07", "OSDS_TU08", "OSDS_TU09", "OSDS_TU10", "OSDS_TU11", "OSDS_TU12", "OSDS_TU13", "OSDS_TU14", "OSDS_TU15", "OSDS_TU16", "OSDS_TU17", "OSDS_TU18", "OSDS_TU19", "OSDS_TU20", "OSDS_TU21", "OSDS_TU22", "OSDS_TU23", "OSDS_TU26", "OSDS_TU27", "OSDS_TU28", "OSDS_TU29", "OSDS_TU30", "OSDS_TU31", "OSDS_TU32", "OSDS_TU33"]
    @collar_names = %w(regular low_semi_wide wide_spread cut_away big_round stand)
    @collar_images = @collar_names.map {|name| "item_collar_#{name}.jpg"}
    @cuff_names = %w(round angle big_round big_angle square french)
    @cuff_images = @cuff_names.map {|name| "item_cuff_#{name}.jpg"}
    @button_names = %w(white purple brown gray darkgray winered saxeblue pink navy)
    @button_images = @button_names.map {|name| "item_button_#{name}.jpg"}
    @tab = 3
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Большое спасибо за заказ! В ближайшее время с Вами свяжется наш оператор.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:first_name, :last_name, :address, :string, :comments, :params)
    end
end
